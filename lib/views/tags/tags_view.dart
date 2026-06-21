import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:anzio/core/databases/models/tag_category_db_model.dart';
import 'package:anzio/core/databases/models/tag_db_model.dart';
import 'package:anzio/core/extensions/color_scheme_extension.dart';
import 'package:flutter/material.dart';
import 'package:anzio/providers/tags_provider.dart';
import 'package:anzio/widgets/base_view/base_route.dart';
import 'package:anzio/widgets/sp_capacity_badge.dart';
import 'package:anzio/widgets/sp_icons.dart';
import 'package:anzio/widgets/sp_scroll_configuration.dart';

import 'tags_view_model.dart';

part 'tags_content.dart';

class TagsRoute extends BaseRoute {
  @override
  String get routeName => 'tags';

  final bool storyViewOnly;
  final bool pickMode;
  final int? maxCount;
  final List<int>? initialSelectedTags;
  final Future<bool> Function(List<int> selectedTags)? onToggleTags;

  TagsRoute({
    this.storyViewOnly = false,
    this.pickMode = false,
    this.maxCount,
    this.initialSelectedTags,
    this.onToggleTags,
  });

  @override
  Widget buildPage(BuildContext context) => TagsView(params: this);
}

class TagsView extends StatelessWidget {
  const TagsView({
    super.key,
    required this.params,
  });

  final TagsRoute params;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TagsViewModel>(
      create: (context) => TagsViewModel(params: params, context: context),
      builder: (context, child) {
        return _TagsContent(Provider.of(context));
      },
    );
  }
}
