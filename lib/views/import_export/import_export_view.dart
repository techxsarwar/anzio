import 'package:easy_localization/easy_localization.dart';
import 'package:provider/provider.dart';
import 'package:anzio/core/objects/search_filter_object.dart';
import 'package:anzio/providers/in_app_purchase_provider.dart';
import 'package:anzio/views/import_export/export_assets/export_assets_view.dart';
import 'package:anzio/views/paywall/paywall_view.dart';
import 'package:anzio/views/search/filter/search_filter_view.dart';
import 'package:flutter/material.dart';
import 'package:anzio/widgets/base_view/base_route.dart';
import 'package:anzio/widgets/sp_icons.dart';
import 'package:anzio/widgets/sp_section_title.dart';
import 'package:anzio/widgets/sp_tap_effect.dart';

import 'import_export_view_model.dart';

part 'import_export_content.dart';
part 'local_widgets/export_section.dart';

class ImportExportRoute extends BaseRoute {
  const ImportExportRoute({
    this.initialExportOption,
  });

  final AppExportOption? initialExportOption;

  @override
  Widget buildPage(BuildContext context) => ImportExportView(params: this);
}

class ImportExportView extends StatelessWidget {
  const ImportExportView({
    super.key,
    required this.params,
  });

  final ImportExportRoute params;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ImportExportViewModel>(
      create: (context) => ImportExportViewModel(params: params),
      builder: (context, child) {
        return _ImportExportContent(Provider.of(context));
      },
    );
  }
}
