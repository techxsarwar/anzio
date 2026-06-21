import 'dart:math';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:anzio/core/databases/models/tag_db_model.dart';
import 'package:anzio/core/helpers/path_helper.dart';
import 'package:anzio/providers/tags_provider.dart';
import 'package:anzio/views/stories/show/show_story_view.dart';
import 'package:flutter/material.dart';
import 'package:anzio/core/databases/models/asset_db_model.dart';
import 'package:anzio/core/databases/models/collection_db_model.dart';
import 'package:anzio/core/databases/models/story_db_model.dart';
import 'package:anzio/core/types/asset_type.dart';
import 'package:anzio/core/extensions/color_scheme_extension.dart';
import 'package:anzio/providers/backup_provider.dart';
import 'package:anzio/providers/device_preferences_provider.dart';
import 'package:anzio/widgets/base_view/base_route.dart';
import 'package:anzio/views/library/show/show_asset_view.dart';
import 'package:anzio/widgets/bottom_sheets/sp_asset_info_sheet.dart';
import 'package:anzio/widgets/bottom_sheets/sp_voice_playback_sheet.dart';
import 'package:anzio/widgets/sp_fade_in.dart';
import 'package:anzio/widgets/sp_icons.dart';
import 'package:anzio/widgets/sp_image.dart';
import 'package:anzio/widgets/sp_images_viewer.dart';
import 'package:anzio/widgets/sp_asset_status_badge.dart';
import 'package:anzio/widgets/sp_asset_story_count_overlay.dart';
import 'package:anzio/widgets/sp_pop_up_menu_button.dart';
import 'package:anzio/widgets/sp_scrollable_choice_chips.dart';
import 'package:anzio/widgets/sp_tap_effect.dart';

import 'library_view_model.dart';

part 'library_content.dart';
part 'local_widgets/empty_body.dart';
part 'local_widgets/image_status.dart';
part 'local_widgets/images_tab_content.dart';
part 'local_widgets/voices_tab_content.dart';

class LibraryRoute extends BaseRoute {
  @override
  String get routeName => 'library';

  LibraryRoute({
    this.initialTabIndex = 0,
  });

  final int initialTabIndex;

  @override
  Widget buildPage(BuildContext context) => LibraryView(params: this);
}

class LibraryView extends StatelessWidget {
  const LibraryView({
    super.key,
    required this.params,
  });

  final LibraryRoute params;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LibraryViewModel>(
      create: (context) => LibraryViewModel(params: params),
      builder: (context, child) {
        final viewModel = Provider.of<LibraryViewModel>(context);

        return LayoutBuilder(
          builder: (context, constraints) {
            return _LibraryContent(viewModel, constraints: constraints);
          },
        );
      },
    );
  }
}
