import 'package:anzio/core/services/backups/backup_service_type.dart';
import 'package:anzio/core/storages/base_object_storages/enum_storage.dart';

class SelectedPurchaseSyncProviderStorage extends EnumStorage<BackupServiceType> {
  @override
  List<BackupServiceType> get values => BackupServiceType.values;
}
