import 'package:anzio/core/storages/base_object_storages/map_storage.dart';
import 'package:anzio/core/storages/storage_adapters/base_storage_adapter.dart';
import 'package:anzio/core/storages/storage_adapters/secure_storage_adaptor.dart';

class GalleryTemplateUsagesCount extends MapStorage {
  @override
  Future<BaseStorageAdapter<String>> get adapter async => SecureStorageAdaptor();
}
