import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:whisqr_puncher/consts/general.dart';
import 'package:whisqr_puncher/models/user.dart';

class StorageUtil {
  final _storage = FlutterSecureStorage();

  Future<String?> _get(String key) async => await _storage.read(key: key);

  Future<void> _set(String key, String value) async =>
      await _storage.write(key: key, value: value);

  Future<User> getUser() async => User.fromMap(Map<String, dynamic>.from(
      jsonDecode((await _get(GeneralConsts.STORAGE_USER) ?? '{}'))));

  Future<void> setUser(User user) async =>
      _set(GeneralConsts.STORAGE_USER, jsonEncode(user.toMap()));

  Future<void> deleteUser() async => await _storage.deleteAll();
}

final StorageUtil storageUtil = StorageUtil();
