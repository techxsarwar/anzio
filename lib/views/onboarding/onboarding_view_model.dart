import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:anzio/core/databases/models/preference_db_model.dart';
import 'package:anzio/providers/nickname_provider.dart';
import 'package:anzio/views/onboarding/steps/onboarding_hello_view.dart';
import 'package:anzio/core/mixins/dispose_aware_mixin.dart';
import 'onboarding_view.dart';

class OnboardingViewModel extends ChangeNotifier with DisposeAwareMixin {
  final OnboardingRoute params;

  OnboardingViewModel({
    required this.params,
  });

  final TextEditingController controller = TextEditingController(text: PreferenceDbModel.db.nickname.get());

  void next(BuildContext context) {
    if (Form.of(context).validate()) {
      String nickname = controller.text.trim();
      context.read<NicknameProvider>().setNickname(nickname);
      OnboardingHelloRoute(nickname: nickname).push(context);
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
