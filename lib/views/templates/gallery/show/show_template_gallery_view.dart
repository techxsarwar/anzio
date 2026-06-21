import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:anzio/core/databases/models/story_preferences_db_model.dart';
import 'package:anzio/core/objects/gallery_template_object.dart';
import 'package:anzio/core/objects/story_page_object.dart';
import 'package:anzio/providers/in_app_purchase_provider.dart';
import 'package:anzio/views/paywall/paywall_view.dart';
import 'package:anzio/views/stories/local_widgets/story_pages_builder.dart';
import 'package:anzio/views/templates/local_widgets/template_note.dart';
import 'package:flutter/material.dart';
import 'package:anzio/widgets/base_view/base_route.dart';
import 'package:anzio/widgets/sp_icons.dart';
import 'package:anzio/widgets/sp_pop_up_menu_button.dart';

import 'show_template_gallery_view_model.dart';

part 'show_template_gallery_content.dart';

class ShowTemplateGalleryRoute extends BaseRoute {
  ShowTemplateGalleryRoute({
    required this.galleryTemplate,
  });

  final GalleryTemplateObject galleryTemplate;

  @override
  Map<String, String?>? get analyticsParameters {
    return {
      'templateId': galleryTemplate.id,
    };
  }

  @override
  Widget buildPage(BuildContext context) => ShowTemplateGalleryView(params: this);
}

class ShowTemplateGalleryView extends StatelessWidget {
  const ShowTemplateGalleryView({
    super.key,
    required this.params,
  });

  final ShowTemplateGalleryRoute params;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ShowTemplateGalleryViewModel>(
      create: (context) => ShowTemplateGalleryViewModel(params: params),
      builder: (context, child) {
        return _ShowTemplateGalleryContent(Provider.of(context));
      },
    );
  }
}
