import 'package:anzio/core/storages/preference_storages/base_storage.dart';
import 'package:anzio/core/storages/storage_adapters/base_storage_adapter.dart';
import 'package:anzio/core/storages/storage_adapters/secure_storage_adaptor.dart';

abstract class SecureStorage<T> extends BaseStorage<T> {
  @override
  Future<BaseStorageAdapter<T>> get adapter async => SecureStorageAdaptor<T>();
}
