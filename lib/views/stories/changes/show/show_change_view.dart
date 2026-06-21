import 'package:anzio/core/databases/models/story_preferences_db_model.dart';
import 'package:anzio/core/objects/story_page_object.dart';
import 'package:anzio/views/stories/local_widgets/story_pages_builder.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:anzio/core/databases/models/story_content_db_model.dart';
import 'package:anzio/widgets/base_view/base_route.dart';

import 'show_change_view_model.dart';

part 'show_change_content.dart';

class ShowChangeRoute extends BaseRoute {
  ShowChangeRoute({
    required this.content,
    required this.preferences,
  });

  final StoryContentDbModel content;
  final StoryPreferencesDbModel? preferences;

  @override
  Widget buildPage(BuildContext context) => ShowChangeView(params: this);
}

class ShowChangeView extends StatelessWidget {
  const ShowChangeView({
    super.key,
    required this.params,
  });

  final ShowChangeRoute params;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ShowChangeViewModel>(
      create: (context) => ShowChangeViewModel(params: params),
      builder: (context, child) {
        return _ShowChangeContent(Provider.of(context));
      },
    );
  }
}
