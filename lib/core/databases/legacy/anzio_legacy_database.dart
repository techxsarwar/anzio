import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:html_character_entities/html_character_entities.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:anzio/core/constants/app_constants.dart';
import 'package:anzio/core/databases/adapters/objectbox/preferences_box.dart';
import 'package:anzio/core/databases/legacy/anzio_legacy_story_model.dart';
import 'package:anzio/core/databases/models/story_content_db_model.dart';
import 'package:anzio/core/databases/models/story_db_model.dart';
import 'package:anzio/core/databases/models/story_page_db_model.dart';
import 'package:anzio/core/helpers/path_helper.dart';
import 'package:anzio/core/services/quill/quill_delta_to_plain_text_service.dart';
import 'package:anzio/core/types/path_type.dart';
import 'package:sqflite/sqflite.dart' as sqlite;

// ignore: implementation_imports
import 'package:flutter_quill/src/document/document.dart';

class StorypadLegacyDatabase {
  sqlite.Database? _database;
  bool get exist => _database != null;

  Future<String?> _getDatabasePath() async {
    String newPath = join(await sqlite.getDatabasesPath(), "write_story.db");
    String oldPath = join(await getApplicationDocumentsDirectory().then((e) => e.path), "write_story.db");

    if (File(newPath).existsSync()) return newPath;
    if (File(oldPath).existsSync()) return oldPath;

    return null;
  }

  Future<sqlite.Database?> _openDatabase(String databasePath) async {
    String? databasePath = await _getDatabasePath();
    if (databasePath == null) return null;

    try {
      return sqlite.openDatabase(databasePath, onOpen: (_) {}, version: 3);
    } catch (e) {
      debugPrint("🐛 Open database dailed: $e");
    }

    return null;
  }

  String singleQuote = "▘";
  Future<(bool, String)> transferToObjectBoxIfNotYet() async {
    if (!kAnzio) return (true, 'Only for Anzio');

    String sharePreferenceKey = "LegacyAnzioImported";
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    bool? imported = sharedPreferences.getBool(sharePreferenceKey);
    if (imported == true) return (true, 'Already Imported');

    String? databasePath = await _getDatabasePath();
    if (databasePath == null) return (true, 'File is not exist!');

    _database ??= await _openDatabase(databasePath);
    if (!exist) return (true, 'Could not open database $databasePath');

    List<Map<dynamic, dynamic>>? storyRows = await _database?.query('story');
    List<Map<dynamic, dynamic>>? userInfoRows = await _database?.query('user_info');
    if (storyRows == null || storyRows.isEmpty) return (true, 'Database empty!');

    try {
      List<StorypadLegacyStoryModel> anzioStories = storyRows.map((json) {
        StorypadLegacyStoryModel story = StorypadLegacyStoryModel.fromJson(json);
        if (story.paragraph != null) {
          String? paragraph = story.paragraph != null ? HtmlCharacterEntities.decode(story.paragraph!) : null;
          return story.copyWith(paragraph: paragraph?.replaceAll(singleQuote, "'"));
        } else {
          return story;
        }
      }).toList();

      List<StoryDbModel> stories = [];
      for (StorypadLegacyStoryModel anzioStory in anzioStories) {
        Document? document;

        if (anzioStory.paragraph != null) {
          dynamic quill = jsonDecode(anzioStory.paragraph!);
          document = Document.fromJson(quill);
        }

        final content = StoryContentDbModel.create(createdAt: anzioStory.createOn).copyWith(
          title: anzioStory.title,
          plainText: document != null ? QuillDeltaToPlainTextService.call(document.root.toDelta().toJson()) : null,
          richPages: [
            StoryPageDbModel(
              id: DateTime.now().millisecondsSinceEpoch,
              title: anzioStory.title,
              body: document?.toDelta().toJson(),
            ),
          ],
        );

        stories.add(
          StoryDbModel(
            type: PathType.docs,
            id: anzioStory.createOn.millisecondsSinceEpoch,
            starred: anzioStory.isFavorite,
            pinned: false,
            feeling: anzioStory.feeling,
            preferencesOrNull: null,
            year: anzioStory.forDate.year,
            month: anzioStory.forDate.month,
            day: anzioStory.forDate.day,
            hour: anzioStory.createOn.hour,
            minute: anzioStory.forDate.minute,
            second: anzioStory.forDate.second,
            updatedAt: anzioStory.updateOn ?? anzioStory.createOn,
            createdAt: anzioStory.createOn,
            lastSavedDeviceId: null,
            galleryTemplateId: null,
            templateId: null,
            tags: [],
            assets: [],
            movedToBinAt: null,
            latestContent: content,
            draftContent: null,
            permanentlyDeletedAt: null,
          ),
        );
      }

      for (StoryDbModel story in stories) {
        await StoryDbModel.db.set(story, runCallbacks: false);
      }

      if (userInfoRows != null && userInfoRows.isNotEmpty) {
        String? nickname = userInfoRows.firstOrNull?['nickname'];
        if (nickname != null) PreferencesBox().nickname.set(nickname);
      }

      await sharedPreferences.setBool(sharePreferenceKey, true);
      return (true, 'DB: ${storyRows.length}, Anzio: ${anzioStories.length}, Anzio v2: ${stories.length}');
    } catch (e) {
      return (false, e.toString());
    }
  }
}
