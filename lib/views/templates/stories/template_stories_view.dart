import 'package:anzio/core/databases/models/template_db_model.dart';
import 'package:anzio/core/objects/gallery_template_object.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:anzio/widgets/base_view/base_route.dart';
import 'package:anzio/widgets/story_list/sp_story_list.dart';
import 'package:anzio/widgets/story_list/sp_story_list_multi_edit_wrapper.dart';

import 'template_stories_view_model.dart';

part 'template_stories_content.dart';

class TemplateStoriesRoute extends BaseRoute {
  TemplateStoriesRoute({
    required this.template,
    required this.galleryTemplate,
  }) : assert(template?.id != null || galleryTemplate?.id != null);

  final TemplateDbModel? template;
  final GalleryTemplateObject? galleryTemplate;

  @override
  Widget buildPage(BuildContext context) => TemplateStoriesView(params: this);
}

class TemplateStoriesView extends StatelessWidget {
  const TemplateStoriesView({
    super.key,
    required this.params,
  });

  final TemplateStoriesRoute params;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TemplateStoriesViewModel>(
      create: (context) => TemplateStoriesViewModel(params: params),
      builder: (context, child) {
        return _TemplateStoriesContent(Provider.of(context));
      },
    );
  }
}
