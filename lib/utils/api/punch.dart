import 'dart:convert';

import 'package:dio/dio.dart';

import 'package:whisqr_puncher/consts/api.dart';
import 'package:whisqr_puncher/models/user.dart';
import 'package:whisqr_puncher/utils/api/index.dart';
import 'package:whisqr_puncher/utils/crypto.dart';
import 'package:whisqr_puncher/utils/storage.dart';

class PunchApi {
  Future<Response?> getTotal(String cardCode) async {
    Map<String, dynamic> data = {"cardcode": cardCode};
    User user = await storageUtil.getUser();
    String hashedData = cryptoUtil.hash(user.sk!, data);
    try {
      Response response = await apiUtil.dio.get(ApiConsts.PUNCH_TOTAL_PATH,
          data: jsonEncode(data),
          options: Options(headers: {'X-Hash': hashedData}));
      print(response);
      print(response.data);
      return response;
    } on DioError catch (e) {
      print(e);
      return e.response;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<Response?> initialize(String cardCode) async {
    User user = await storageUtil.getUser();
    Map<String, dynamic> data = {
      "cardcode": cardCode,
      "locationcode": user.locationCode
    };
    String hashedData = cryptoUtil.hash(user.sk!, data);
    try {
      Response response = await apiUtil.dio.post(ApiConsts.PUNCH_PATH,
          data: jsonEncode(data),
          options: Options(headers: {'X-Hash': hashedData}));
      return response;
    } on DioError catch (e) {
      print(e);
      return e.response;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<Response?> update(
      String punchCode, Map<String, dynamic> details) async {
    User user = await storageUtil.getUser();
    Map<String, dynamic> data = {"details": details};
    String hashedData = cryptoUtil.hash(user.sk!, data);
    print(hashedData);
    print(user.pk);
    print(jsonEncode(data));
    print(data);
    try {
      Response response = await apiUtil.dio.put(
          '${ApiConsts.PUNCH_PATH}/$punchCode',
          data: jsonEncode(data),
          options: Options(headers: {'X-Hash': hashedData}));
      return response;
    } on DioError catch (e) {
      print(e);
      return e.response;
    } catch (e) {
      print(e);
      return null;
    }
  }
}

final PunchApi punchApi = PunchApi();
