import 'dart:convert';

import 'package:dio/dio.dart';

import 'package:whisqr_puncher/consts/api.dart';
import 'package:whisqr_puncher/models/redeemable.dart';
import 'package:whisqr_puncher/models/user.dart';
import 'package:whisqr_puncher/utils/api/index.dart';
import 'package:whisqr_puncher/utils/crypto.dart';
import 'package:whisqr_puncher/utils/storage.dart';

class RedeemApi {
  Future<Response?> update(String punchCode, List<Redeemable> details) async {
    User user = await storageUtil.getUser();
    Map<String, dynamic> data = {
      "details":
          details.map((Redeemable redeemable) => redeemable.toMap()).toList()
    };
    String hashedData = cryptoUtil.hash(user.sk!, data);
    try {
      Response response = await apiUtil.dio.put(
          '${ApiConsts.REDEMPTION_PATH}/$punchCode',
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

final RedeemApi redeemApi = RedeemApi();
