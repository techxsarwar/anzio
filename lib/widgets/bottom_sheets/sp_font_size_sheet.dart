import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:anzio/core/types/font_size_option.dart';
import 'package:anzio/widgets/bottom_sheets/base_bottom_sheet.dart';
import 'package:anzio/widgets/sp_fade_in.dart';
import 'package:anzio/widgets/sp_icons.dart';
import 'package:anzio/widgets/sp_single_state_widget.dart';

class SpFontSizeSheet extends BaseBottomSheet {
  const SpFontSizeSheet({
    required this.fontSize,
    required this.isDefaultToSystem,
    required this.onChanged,
  });

  final FontSizeOption? fontSize;
  final bool isDefaultToSystem;
  final void Function(FontSizeOption? fontSize) onChanged;

  @override
  bool get fullScreen => false;

  @override
  Widget build(BuildContext context, double bottomPadding) {
    return SpSingleStateWidget.listen(
      initialValue: fontSize,
      builder: (context, selectedFontSize, notifier) {
        return SingleChildScrollView(
          padding: EdgeInsets.zero,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              ...[null, ...FontSizeOption.values].map((fontSize) {
                String? label = fontSize?.label;

                if (isDefaultToSystem) {
                  label ??= "${tr('general.system')} (${tr('general.default')})";
                } else {
                  label ??= tr('general.default');
                }

                return ListTile(
                  title: Text(label),
                  trailing: Visibility(
                    visible: fontSize == selectedFontSize,
                    child: SpFadeIn.fromBottom(
                      child: Icon(
                        SpIcons.checkCircle,
                        color: ColorScheme.of(context).primary,
                      ),
                    ),
                  ),
                  onTap: () {
                    notifier.value = fontSize;
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
