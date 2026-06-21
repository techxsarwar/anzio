import 'package:flutter/cupertino.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:just_audio/just_audio.dart';
import 'package:anzio/core/databases/models/relex_sound_mix_model.dart';
import 'package:anzio/core/services/color_from_day_service.dart';
import 'package:anzio/providers/in_app_purchase_provider.dart';
import 'package:anzio/views/paywall/paywall_view.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:anzio/widgets/base_view/base_route.dart';
import 'dart:io';
import 'dart:ui';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_markdown_plus/flutter_markdown_plus.dart';
import 'package:flutter_svg/svg.dart';
import 'package:anzio/core/constants/app_constants.dart';
import 'package:anzio/core/extensions/color_scheme_extension.dart';
import 'package:anzio/core/objects/relax_sound_object.dart';
import 'package:anzio/core/services/url_opener_service.dart';
import 'package:anzio/providers/relax_sounds_provider.dart';
import 'package:anzio/widgets/sp_fade_in.dart';
import 'package:anzio/widgets/sp_firestore_storage_downloader_builder.dart';
import 'package:anzio/widgets/sp_floating_relax_sound_tile.dart';
import 'package:anzio/widgets/sp_icons.dart';
import 'package:anzio/widgets/sp_loop_animation_builder.dart';

import 'package:anzio/widgets/sp_pop_up_menu_button.dart';
import 'package:anzio/widgets/sp_tap_effect.dart';
import 'relax_sounds_view_model.dart';

part 'local_widgets/volume_slider.dart';
part 'local_widgets/sound_icon_card.dart';
part 'local_widgets/license_text.dart';
part 'local_widgets/sound_icon_loading.dart';
part 'local_widgets/mixes_tab.dart';
part 'local_widgets/sounds_tab.dart';

part 'relax_sounds_content.dart';

class RelaxSoundsRoute extends BaseRoute {
  @override
  String get routeName => 'relax_sounds';

  const RelaxSoundsRoute();

  @override
  Widget buildPage(BuildContext context) => RelaxSoundsView(params: this);
}

class RelaxSoundsView extends StatelessWidget {
  const RelaxSoundsView({
    super.key,
    required this.params,
  });

  final RelaxSoundsRoute params;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<RelaxSoundsViewModel>(
      create: (context) => RelaxSoundsViewModel(
        params: params,
        provider: context.read<RelaxSoundsProvider>(),
      ),
      builder: (context, child) {
        return _RelaxSoundsContent(Provider.of(context));
      },
    );
  }
}
