import 'package:easy_localization/easy_localization.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:anzio/core/databases/models/place_db_model.dart';
import 'package:anzio/core/objects/sp_latlng.dart';
import 'package:anzio/widgets/base_view/base_route.dart';
import 'package:anzio/widgets/maps/map_types.dart';
import 'package:anzio/widgets/maps/sp_flutter_map.dart';
import 'package:anzio/widgets/maps/sp_google_maps_flutter.dart';
import 'package:anzio/widgets/maps/sp_map_controller.dart';
import 'package:anzio/widgets/sp_icons.dart';

import 'map_picker_manual_input_view_model.dart';

part 'map_picker_manual_input_content.dart';

class MapPickerManualInputRoute extends BaseRoute {
  const MapPickerManualInputRoute();

  @override
  Widget buildPage(BuildContext context) => MapPickerManualInputView(params: this);
}

class MapPickerManualInputView extends StatelessWidget {
  const MapPickerManualInputView({
    super.key,
    required this.params,
  });

  final MapPickerManualInputRoute params;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MapPickerManualInputViewModel>(
      create: (context) => MapPickerManualInputViewModel(params: params),
      builder: (context, child) {
        return _MapPickerManualInputContent(Provider.of(context));
      },
    );
  }
}
