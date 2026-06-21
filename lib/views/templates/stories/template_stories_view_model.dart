import 'package:flutter/material.dart';
import 'package:anzio/core/mixins/dispose_aware_mixin.dart';
import 'package:anzio/core/objects/search_filter_object.dart';
import 'package:anzio/core/types/path_type.dart';
import 'template_stories_view.dart';

class TemplateStoriesViewModel extends ChangeNotifier with DisposeAwareMixin {
  final TemplateStoriesRoute params;

  TemplateStoriesViewModel({
    required this.params,
  });

  late SearchFilterObject filter = SearchFilterObject(
    years: {},
    types: {PathType.docs},
    assetId: null,
    templateId: params.template?.id,
    galleryTemplateId: params.galleryTemplate?.id,
  );
}
