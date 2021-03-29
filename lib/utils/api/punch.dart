import 'dart:convert';

import 'package:dio/dio.dart';

import 'package:whisqr_puncher/consts/api.dart';
import 'package:whisqr_puncher/models/user.dart';
import 'package:whisqr_puncher/utils/api/index.dart';
import 'package:whisqr_puncher/utils/crypto.dart';
import 'package:whisqr_puncher/utils/storage.dart';

class PunchApi {
  Future<Response> getTotal(String cardCode) async {
    Map<String, dynamic> data = {"cardcode": cardCode};
    User user = await storageUtil.getUser();
    String hashedData = cryptoUtil.hash(user.sk, data);
    print(user.pk);
    print(user.sk);
    print(data);
    print(hashedData);
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
}

final PunchApi punchApi = PunchApi();
