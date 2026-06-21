import 'dart:io';
import 'dart:ui';
import 'package:animations/animations.dart';
import 'package:easy_localization/easy_localization.dart' show tr, BuildContextEasyLocalizationExtension;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:anzio/app_theme.dart';
import 'package:anzio/core/constants/app_constants.dart';
import 'package:anzio/core/databases/models/collection_db_model.dart';
import 'package:anzio/core/databases/models/story_db_model.dart';
import 'package:anzio/core/extensions/color_scheme_extension.dart';
import 'package:anzio/core/helpers/date_format_helper.dart';
import 'package:anzio/core/services/color_from_day_service.dart';
import 'package:anzio/core/services/welcome_message_service.dart';
import 'package:anzio/core/services/windowed_detector_service.dart';
import 'package:anzio/providers/backup_provider.dart';
import 'package:anzio/providers/device_preferences_provider.dart';
import 'package:anzio/providers/in_app_purchase_provider.dart';
import 'package:anzio/providers/in_app_update_provider.dart';
import 'package:anzio/providers/nickname_provider.dart';
import 'package:anzio/providers/root_provider.dart';
import 'package:anzio/views/home/local_widgets/end_drawer/home_end_drawer.dart';
import 'package:anzio/views/root/root_view.dart';
import 'package:anzio/views/settings/settings_view.dart';
import 'package:anzio/widgets/base_view/base_route.dart';
import 'package:anzio/widgets/sp_cross_fade.dart';
import 'package:anzio/widgets/sp_fab_location.dart';
import 'package:anzio/widgets/sp_fade_in.dart';
import 'package:anzio/widgets/sp_icons.dart';
import 'package:anzio/widgets/sp_loop_animation_builder.dart';
import 'package:anzio/widgets/sp_measure_size.dart';
import 'package:anzio/widgets/sp_multi_edit_bottom_nav_bar.dart';
import 'package:anzio/widgets/sp_nested_navigation.dart';
import 'package:anzio/widgets/sp_scroll_configuration.dart';
import 'package:anzio/widgets/side_items/side_items.dart';
import 'package:anzio/widgets/sp_tap_effect.dart';
import 'package:anzio/widgets/sp_throwback_tile.dart';
import 'package:anzio/widgets/story_list/sp_story_list_multi_edit_wrapper.dart';
import 'package:anzio/widgets/story_list/sp_story_listener_builder.dart';
import 'package:anzio/widgets/story_list/sp_story_tile_list_item.dart';

import 'home_view_model.dart';

part 'home_content.dart';
part 'local_widgets/app_update_floating_button.dart';
part 'local_widgets/home_app_bar.dart';
part 'local_widgets/home_app_bar_message.dart';
part 'local_widgets/home_app_bar_nickname.dart';
part 'local_widgets/home_empty.dart';
part 'local_widgets/home_flexible_space_bar.dart';
part 'local_widgets/home_floating_buttons.dart';
part 'local_widgets/home_scaffold.dart';
part 'local_widgets/home_tab_bar.dart';
part 'local_widgets/home_timeline_side_bar.dart';
part 'local_widgets/rounded_indicator.dart';
part 'local_widgets/pin_story_icon_button.dart';

class HomeRoute extends BaseRoute {
  @override
  String get routeName => 'home';

  const HomeRoute();

  @override
  Widget buildPage(BuildContext context) => const HomeView();
}

class HomeView extends StatelessWidget {
  const HomeView({
    super.key,
  });

  static BuildContext? _homeContext;
  static BuildContext? get homeContext => _homeContext;

  static Future<void> reload({
    required String debugSource,
  }) async {
    return _homeContext?.read<HomeViewModel>().reload(debugSource: debugSource);
  }

  static void scrollToTop() {
    _homeContext!.read<HomeViewModel>().scrollInfo.scrollToTop();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeViewModel>(
      create: (context) => HomeViewModel(),
      builder: (context, child) {
        _homeContext = context;
        return _HomeContent(Provider.of(context));
      },
    );
  }
}
