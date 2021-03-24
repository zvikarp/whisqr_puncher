import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:whisqr_puncher/consts/general.dart';
import 'package:whisqr_puncher/models/user.dart';

class StorageUtil {
  final _storage = FlutterSecureStorage();

  Future<String> get(String key) async => await _storage.read(key: key);

  Future<void> set(String key, String value) async =>
      await _storage.write(key: key, value: value);

  Future<User> getUser() async => User.fromMap(Map<String, dynamic>.from(
      jsonDecode((await get(GeneralConsts.STORAGE_USER) ?? '{}'))));

  Future<void> setUser(User user) async =>
      set(GeneralConsts.STORAGE_USER, jsonEncode(user.toMap()));
}

final StorageUtil storageUtil = StorageUtil();
