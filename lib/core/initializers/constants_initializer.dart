import 'dart:io';
import 'package:flutter/services.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:anzio/core/constants/app_constants.dart';
import 'package:anzio/core/helpers/path_helper.dart';
import 'package:anzio/core/objects/device_info_object.dart';
import 'package:anzio/core/services/app_logo_service.dart';

class ConstantsInitializer {
  static Future<void> call() async {
    kSupportDirectory = await _getDirectoryOrFallback(
      getApplicationSupportDirectory,
      Directory('${_homeDirectory.path}/.local/share/anzio'),
    );

    kApplicationDirectory =
        (Platform.isAndroid ? await getExternalStorageDirectory() : null) ??
        await _getDirectoryOrFallback(
          getApplicationDocumentsDirectory,
          Directory('${_homeDirectory.path}/Documents/Anzio'),
        );

    kPackageInfo = await PackageInfo.fromPlatform();
    kDeviceInfo = await DeviceInfoObject.get();

    /// package:flutter/src/widgets/editable_text.dart [_processTextActions]
    kProcessTextActions = await DefaultProcessTextService().queryTextActions();
    kAppLogo = await AppLogoService().getCurrent();
  }

  static Directory get _homeDirectory {
    return Directory(Platform.environment['HOME'] ?? Directory.current.path);
  }

  static Future<Directory> _getDirectoryOrFallback(
    Future<Directory> Function() getter,
    Directory fallback,
  ) async {
    try {
      return await getter();
    } catch (_) {
      if (Platform.isLinux) return fallback;
      rethrow;
    }
  }
}
