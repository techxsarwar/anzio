import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:anzio/core/mixins/dispose_aware_mixin.dart';
import 'package:anzio/providers/device_preferences_provider.dart';
import 'package:anzio/widgets/bottom_sheets/sp_demo_images_sheet.dart';
import 'add_ons_view.dart';

class AddOnsViewModel extends ChangeNotifier with DisposeAwareMixin {
  final AddOnsRoute params;
  final DevicePreferencesProvider devicePreferencesProvider;

  AddOnsViewModel({
    required this.params,
    required BuildContext context,
  }) : devicePreferencesProvider = context.read<DevicePreferencesProvider>() {
    SpDemoImagesSheet.preloadDemoImages();
    devicePreferencesProvider.addListenerForAddOnChanges(notifyListeners);
  }

  @override
  void dispose() {
    devicePreferencesProvider.removeListenerForAddOnChanges(notifyListeners);
    super.dispose();
  }
}
