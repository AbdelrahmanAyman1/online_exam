import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:online_exam/core/helper/storage_contract.dart';
import 'dart:developer';

class SecureStorage extends StorageContract {
  static final _storage = FlutterSecureStorage();
  @override
  Future<void> delete(String key) {
    return _storage.delete(key: key);
  }

  @override
  Future<String?> read(String key) {
    return _storage.read(key: key);
  }

  @override
  Future<void> write(String key, String value) {
    log(value);
    return _storage.write(key: key, value: value);
  }
}
