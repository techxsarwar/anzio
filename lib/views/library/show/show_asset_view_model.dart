import 'package:flutter/material.dart';
import 'package:anzio/core/mixins/dispose_aware_mixin.dart';
import 'show_asset_view.dart';

class ShowAssetViewModel extends ChangeNotifier with DisposeAwareMixin {
  final ShowAssetRoute params;

  ShowAssetViewModel({
    required this.params,
  });
}
