import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:anzio/core/extensions/string_extension.dart';
import 'package:anzio/core/objects/backup_object.dart';
import 'package:anzio/core/helpers/date_format_helper.dart';

import 'package:provider/provider.dart';
import 'package:anzio/widgets/base_view/base_route.dart';
import 'package:anzio/widgets/sp_icons.dart';
import 'package:anzio/widgets/sp_pop_up_menu_button.dart';

import 'show_backup_view_model.dart';

part 'show_backup_content.dart';

class ShowBackupsRoute extends BaseRoute {
  ShowBackupsRoute(this.backup);

  final BackupObject backup;

  @override
  Widget buildPage(BuildContext context) => ShowBackupView(params: this);
}

class ShowBackupView extends StatelessWidget {
  const ShowBackupView({
    super.key,
    required this.params,
  });

  final ShowBackupsRoute params;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ShowBackupsViewModel>(
      create: (context) => ShowBackupsViewModel(params: params),
      builder: (context, child) {
        return _ShowBackupContent(Provider.of(context));
      },
    );
  }
}
