import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:anzio/core/databases/models/tag_db_model.dart';
import 'package:anzio/core/objects/search_filter_object.dart';
import 'package:anzio/widgets/sp_icons.dart';
import 'package:anzio/widgets/sp_multi_edit_bottom_nav_bar.dart';
import 'package:anzio/widgets/sp_scrollable_choice_chips.dart';
import 'package:anzio/widgets/story_list/sp_story_list_multi_edit_wrapper.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:anzio/widgets/base_view/base_route.dart';
import 'package:anzio/widgets/story_list/sp_story_list.dart';

import 'search_view_model.dart';

part 'search_content.dart';

class SearchRoute extends BaseRoute {
  final SearchFilterObject? initialFilter;

  @override
  String get routeName => 'search';

  SearchRoute({
    this.initialFilter,
  });

  @override
  Widget buildPage(BuildContext context) => SearchView(params: this);
}

class SearchView extends StatelessWidget {
  const SearchView({
    super.key,
    required this.params,
  });

  final SearchRoute params;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SearchViewModel>(
      create: (context) => SearchViewModel(params: params, context: context),
      builder: (context, child) {
        return _SearchContent(Provider.of(context));
      },
    );
  }
}
