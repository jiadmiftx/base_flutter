import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'storage_key_helper.dart';

class Storage {
  final _storage = const FlutterSecureStorage();
  Future<String?> get getAuthToken async => await read(StorageKey.authToken);
  Future<String?> get getDeviceToken async => await read(StorageKey.deviceToken);
  Future<String?> get getUserId async => await read(StorageKey.userid);
  Future<String?> get getFullName async => await read(StorageKey.fullName);
  Future<String?> get getNoKK async => await read(StorageKey.noKk);
  Future<String?> get getRole async => await read(StorageKey.role);
  Future<String?> get getRolePermission async => await read(StorageKey.rolePermission);
  Future<String?> get getCheckinData async => await read(StorageKey.checkInData);
  Future<String?> get getRefrestToken async => await read(StorageKey.refreshToken);
  Future<String?> get getLanguageCode async => await read(StorageKey.languageCode);
  Future<String?> get getSavedAppVersion async => await read(StorageKey.savedAppVersion);
  Future<String?> get getPopUpUU async => await read(StorageKey.popUpUU);

  Future<void> write(StorageKey key, String value) async {
    _storage.write(
      key: describeEnum(key),
      value: value,
      aOptions: const AndroidOptions(encryptedSharedPreferences: true),
    );
  }

  Future<String?> read(StorageKey key) async {
    return await _storage.read(
        key: describeEnum(key),
        aOptions: const AndroidOptions(
          encryptedSharedPreferences: true,
        ));
  }

  Future<void> clear() async {
    await _storage.delete(
      key: describeEnum(StorageKey.authToken),
      aOptions: const AndroidOptions(encryptedSharedPreferences: true),
    );
    await _storage.delete(
      key: describeEnum(StorageKey.userid),
      aOptions: const AndroidOptions(encryptedSharedPreferences: true),
    );
    await _storage.delete(
      key: describeEnum(StorageKey.noKk),
      aOptions: const AndroidOptions(encryptedSharedPreferences: true),
    );
    await _storage.delete(
      key: describeEnum(StorageKey.rolePermission),
      aOptions: const AndroidOptions(encryptedSharedPreferences: true),
    );
    await _storage.delete(
      key: describeEnum(StorageKey.role),
      aOptions: const AndroidOptions(encryptedSharedPreferences: true),
    );
    await _storage.delete(
      key: describeEnum(StorageKey.popUpUU),
      aOptions: const AndroidOptions(encryptedSharedPreferences: true),
    );
  }
}

final storage = Storage();
