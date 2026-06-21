import 'package:easy_localization/easy_localization.dart';
import 'package:provider/provider.dart';
import 'package:anzio/providers/backup_provider.dart';
import 'package:anzio/views/backup_services/local_widgets/backup_service_tile.dart';
import 'package:anzio/views/import_export/import_export_view.dart';
import 'package:flutter/material.dart';
import 'package:anzio/widgets/base_view/base_route.dart';

import 'backup_services_view_model.dart';

part 'backup_services_content.dart';

class BackupServicesRoute extends BaseRoute {
  const BackupServicesRoute();

  @override
  String? get routeName => 'backup_services';

  @override
  Widget buildPage(BuildContext context) => BackupServicesView(params: this);
}

class BackupServicesView extends StatelessWidget {
  const BackupServicesView({
    super.key,
    required this.params,
  });

  final BackupServicesRoute params;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<BackupServicesViewModel>(
      create: (context) => BackupServicesViewModel(context: context, params: params),
      builder: (context, child) {
        return _BackupServicesContent(Provider.of(context));
      },
    );
  }
}
