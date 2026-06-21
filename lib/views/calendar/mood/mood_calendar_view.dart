import 'dart:convert';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:anzio/core/databases/models/tag_db_model.dart';
import 'package:anzio/core/objects/search_filter_object.dart';
import 'package:anzio/core/types/path_type.dart';
import 'package:anzio/providers/device_preferences_provider.dart';
import 'package:anzio/widgets/calendar/sp_calendar.dart';
import 'package:anzio/widgets/calendar/sp_calendar_date_cell.dart';
import 'package:anzio/widgets/sp_fab_location.dart';
import 'package:anzio/widgets/sp_fade_in.dart';
import 'package:anzio/widgets/sp_icons.dart';
import 'package:anzio/widgets/sp_scrollable_choice_chips.dart';
import 'package:anzio/widgets/story_list/sp_story_list.dart';

import 'mood_calendar_view_model.dart';

part 'mood_calendar_content.dart';

class MoodCalendarView extends StatelessWidget {
  const MoodCalendarView({
    super.key,
    required this.monthYearNotifier,
    required this.hasMultipleSegments,
    required this.initialSelectedDay,
  });

  final bool hasMultipleSegments;
  final int? initialSelectedDay;
  final ValueNotifier<({int year, int month})> monthYearNotifier;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MoodCalendarViewModel>(
      create: (context) => MoodCalendarViewModel(
        params: this,
        context: context,
      ),
      builder: (context, child) {
        return _CalendarStoriesContent(Provider.of(context));
      },
    );
  }
}
