import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:anzio/app_theme.dart';
import 'package:anzio/core/constants/app_constants.dart';
import 'package:anzio/core/extensions/matrix_4_extension.dart';
import 'package:anzio/core/services/analytics/analytics_service.dart';
import 'package:anzio/core/services/messenger_service.dart';
import 'package:anzio/core/services/remote_config/remote_config_service.dart';
import 'package:anzio/core/services/url_opener_service.dart';
import 'package:anzio/views/developer_options/developer_options_view.dart';
import 'package:anzio/views/home/home_view.dart';
import 'package:anzio/views/support_us/support_us_view.dart';
import 'package:anzio/widgets/sp_fade_in.dart';
import 'package:anzio/widgets/sp_icons.dart';
import 'package:anzio/widgets/sp_onboarding_wrapper.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:anzio/widgets/base_view/base_route.dart';

import 'community_view_model.dart';

part 'community_content.dart';
part 'local_widgets/community_card.dart';

class CommunityRoute extends BaseRoute {
  CommunityRoute();

  @override
  String? get routeName => 'community';

  @override
  Widget buildPage(BuildContext context) => CommunityView(params: this);
}

class CommunityView extends StatelessWidget {
  const CommunityView({
    super.key,
    required this.params,
  });

  final CommunityRoute params;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CommunityViewModel>(
      create: (context) => CommunityViewModel(params: params),
      builder: (context, child) {
        return _CommunityContent(Provider.of(context));
      },
    );
  }
}
