import 'package:flutter/material.dart';
import 'package:anzio/core/types/time_format_option.dart';
import 'package:anzio/widgets/bottom_sheets/base_bottom_sheet.dart';
import 'package:anzio/widgets/sp_fade_in.dart';
import 'package:anzio/widgets/sp_icons.dart';
import 'package:anzio/widgets/sp_single_state_widget.dart';

class SpTimeFormatSheet extends BaseBottomSheet {
  const SpTimeFormatSheet({
    required this.timeFormat,
    required this.onChanged,
  });

  final TimeFormatOption timeFormat;
  final void Function(TimeFormatOption timeFormat) onChanged;

  @override
  bool get fullScreen => false;

  @override
  Widget build(BuildContext context, double bottomPadding) {
    return SpSingleStateWidget.listen(
      initialValue: timeFormat,
      builder: (context, selectedTimeFormat, notifier) {
        return SingleChildScrollView(
          padding: EdgeInsets.zero,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              ...TimeFormatOption.values.map((timeFormat) {
                return ListTile(
                  title: Text(timeFormat.label),
                  trailing: Visibility(
                    visible: timeFormat == selectedTimeFormat,
                    child: SpFadeIn.fromBottom(
                      child: Icon(
                        SpIcons.checkCircle,
                        color: ColorScheme.of(context).primary,
                      ),
                    ),
                  ),
                  onTap: () {
                    notifier.value = timeFormat;
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
