// ignore_for_file: library_private_types_in_public_api

import 'package:anzio/core/constants/app_constants.dart';
import 'package:anzio/core/databases/legacy/anzio_legacy_database.dart';
import 'package:anzio/core/databases/models/collection_db_model.dart';
import 'package:anzio/core/databases/models/story_db_model.dart';

class LegacyAnzioInitializer {
  static Future<void> call() async {
    if (!kAnzio) return;
    await _loadFromLegacyStorypadIfShould();
  }

  static Future<_LegacyStorypadMigrationResponse> _loadFromLegacyStorypadIfShould() async {
    (bool, String) result = await StorypadLegacyDatabase().transferToObjectBoxIfNotYet();

    bool success = result.$1;
    String message = result.$2;

    return _LegacyStorypadMigrationResponse(
      success: success,
      message: message,
    );
  }
}

class LegacyAnzioInitializerData {
  final String? nickname;
  final int year;
  final CollectionDbModel<StoryDbModel>? stories;
  final _LegacyStorypadMigrationResponse? legacyStorypadMigrationResponse;

  LegacyAnzioInitializerData({
    required this.nickname,
    required this.year,
    required this.stories,
    required this.legacyStorypadMigrationResponse,
  });
}

class _LegacyStorypadMigrationResponse {
  final bool success;
  final String message;

  _LegacyStorypadMigrationResponse({
    required this.success,
    required this.message,
  });
}
