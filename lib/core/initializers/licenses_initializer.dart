import 'package:flutter/foundation.dart';
import 'package:anzio/core/constants/app_constants.dart';

class LicensesInitializer {
  static void call() {
    if (kAnzio) _addAnzioLogoLicense();
  }

  static void _addAnzioLogoLicense() {
    const String logoLicense =
        'The logo used in this app was designed by Meng Long. It is licensed under the Creative Commons Attribution 4.0 International License (CC BY 4.0)';
    LicenseRegistry.addLicense(() {
      return Stream<LicenseEntry>.value(
        const LicenseEntryWithLineBreaks(<String>['_ Logo Design 🎨'], logoLicense),
      );
    });
  }
}
