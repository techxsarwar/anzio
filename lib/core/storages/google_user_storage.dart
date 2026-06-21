import 'package:anzio/core/objects/google_user_object.dart';
import 'package:anzio/core/storages/base_object_storages/object_storage.dart';
import 'package:anzio/core/storages/storage_adapters/base_storage_adapter.dart';
import 'package:anzio/core/storages/storage_adapters/secure_storage_adaptor.dart';

class GoogleUserStorage extends ObjectStorage<GoogleUserObject> {
  @override
  Future<BaseStorageAdapter<String>> get adapter async => SecureStorageAdaptor();

  @override
  GoogleUserObject decode(Map<String, dynamic> json) => GoogleUserObject.fromJson(json);

  @override
  Map<String, dynamic> encode(GoogleUserObject object) => object.toJson();
}
