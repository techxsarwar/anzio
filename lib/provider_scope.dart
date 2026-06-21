import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:anzio/providers/app_lock_provider.dart';
import 'package:anzio/providers/backup_provider.dart';
import 'package:anzio/providers/in_app_purchase_provider.dart';
import 'package:anzio/providers/in_app_update_provider.dart';
import 'package:anzio/providers/nickname_provider.dart';
import 'package:anzio/providers/relax_sounds_provider.dart';
import 'package:anzio/providers/root_provider.dart';
import 'package:anzio/providers/tags_provider.dart';
import 'package:anzio/providers/device_preferences_provider.dart';

// global providers
class ProviderScope extends StatelessWidget {
  const ProviderScope({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ListenableProvider<RootProvider>(
          create: (context) => RootProvider(),
        ),
        ListenableProvider<BackupProvider>(
          create: (context) => BackupProvider(),
        ),
        ListenableProvider<TagsProvider>(
          create: (context) => TagsProvider(),
        ),
        ListenableProvider<AppLockProvider>(
          create: (context) => AppLockProvider(),
        ),
        ListenableProvider<DevicePreferencesProvider>(
          create: (context) => DevicePreferencesProvider(),
        ),
        ListenableProvider<InAppUpdateProvider>(
          create: (context) => InAppUpdateProvider(),
        ),
        ListenableProvider<InAppPurchaseProvider>(
          create: (context) => InAppPurchaseProvider(),
        ),
        ListenableProvider<NicknameProvider>(
          create: (context) => NicknameProvider(),
        ),
        ListenableProvider<RelaxSoundsProvider>(
          lazy: true,
          create: (context) => RelaxSoundsProvider(),
        ),
      ],
      child: child,
    );
  }
}
