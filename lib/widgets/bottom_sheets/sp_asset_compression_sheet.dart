import 'package:flutter/material.dart';
import 'package:anzio/core/types/asset_compression_option.dart';
import 'package:anzio/widgets/bottom_sheets/base_bottom_sheet.dart';
import 'package:anzio/widgets/sp_fade_in.dart';
import 'package:anzio/widgets/sp_icons.dart';
import 'package:anzio/widgets/sp_single_state_widget.dart';

class SpAssetCompressionSheet extends BaseBottomSheet {
  const SpAssetCompressionSheet({
    required this.assetCompression,
    required this.onChanged,
  });

  final AssetCompressionOption assetCompression;
  final void Function(AssetCompressionOption assetCompression) onChanged;

  @override
  bool get fullScreen => false;

  @override
  Widget build(BuildContext context, double bottomPadding) {
    return SpSingleStateWidget.listen(
      initialValue: assetCompression,
      builder: (context, selectedAssetCompression, notifier) {
        return SingleChildScrollView(
          padding: EdgeInsets.zero,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              ...AssetCompressionOption.values.map((assetCompression) {
                return ListTile(
                  title: Text(assetCompression.labelWithDefault),
                  trailing: Visibility(
                    visible: assetCompression == selectedAssetCompression,
                    child: SpFadeIn.fromBottom(
                      child: Icon(
                        SpIcons.checkCircle,
                        color: ColorScheme.of(context).primary,
                      ),
                    ),
                  ),
                  onTap: () {
                    notifier.value = assetCompression;
                    onChanged(notifier.value);
                  },
                );
              }),
              SizedBox(height: MediaQuery.of(context).padding.bottom),
            ],
          ),
        );
      },
    );
  }
}
