import 'package:flutter/material.dart';
import 'package:anzio/core/storages/onboarded_storage.dart';
import 'package:anzio/widgets/sp_onboarding_wrapper.dart';
import 'package:anzio/core/mixins/dispose_aware_mixin.dart';
import 'onboarding_step_4_view.dart';

class OnboardingStep4ViewModel extends ChangeNotifier with DisposeAwareMixin {
  final OnboardingStep4Route params;

  OnboardingStep4ViewModel({
    required this.params,
  });

  void getStarted(BuildContext context) {
    OnboardedStorage().write(true);
    SpOnboardingWrapper.close(context);
  }
}
