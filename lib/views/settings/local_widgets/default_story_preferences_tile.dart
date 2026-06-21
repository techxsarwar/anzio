import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:anzio/core/objects/default_story_preferences_object.dart';
import 'package:anzio/providers/device_preferences_provider.dart';
import 'package:anzio/providers/in_app_purchase_provider.dart';
import 'package:anzio/widgets/bottom_sheets/sp_default_story_preferences_sheet.dart';
import 'package:anzio/widgets/sp_icons.dart';
import 'package:anzio/widgets/sp_setting_icon_badge.dart';

class DefaultStoryPreferencesTile extends StatelessWidget {
  const DefaultStoryPreferencesTile({super.key, required this.weekday});

  final int weekday;

  @override
  Widget build(BuildContext context) {
    final locked = !Provider.of<InAppPurchaseProvider>(context).isProUser;

    return ListTile(
      leading: SpSettingIconBadge(weekday: weekday, icon: SpIcons.edit),
      title: Text(tr("list_tile.default_story_preferences.title")),
      trailing: locked ? const Icon(SpIcons.lock) : null,
      onTap: () async {
        final result = await const SpDefaultStoryPreferencesSheet().show(context: context);
        if (context.mounted && result is DefaultStoryPreferencesObject) {
          context.read<DevicePreferencesProvider>().setDefaultStoryPreferences(result);
        }
      },
    );
  }
}
