// import 'dart:convert';

// import 'package:dio/dio.dart';

// import 'package:whisqr_puncher/consts/api.dart';
// import 'package:whisqr_puncher/models/user.dart';
// import 'package:whisqr_puncher/utils/api/index.dart';
// import 'package:whisqr_puncher/utils/crypto.dart';
// import 'package:whisqr_puncher/utils/storage.dart';

class RedeemApi {
  // WIP
  // Future<Response?> update(
  //     String punchAction, int rewardIndex, int count) async {
  //   Map<String, dynamic> data = {
  //     "details": [
  //       {"count": 2, "rewardindex": 2}
  //     ]
  //   };
  //   User user = await storageUtil.getUser();
  //   String hashedData = cryptoUtil.hash(user.sk!, data);
  //   try {
  //     Response response = await apiUtil.dio.get(ApiConsts.PUNCH_TOTAL_PATH,
  //         data: jsonEncode(data),
  //         options: Options(headers: {'X-Hash': hashedData}));
  //     return response;
  //   } on DioError catch (e) {
  //     print(e);
  //     return e.response;
  //   } catch (e) {
  //     print(e);
  //     return null;
  //   }
  // }

  // Future<Response?> initialize(String cardCode) async {
  //   User user = await storageUtil.getUser();
  //   Map<String, dynamic> data = {
  //     "cardcode": cardCode,
  //     "locationcode": user.locationCode
  //   };
  //   String hashedData = cryptoUtil.hash(user.sk!, data);
  //   try {
  //     Response response = await apiUtil.dio.post(ApiConsts.PUNCH_PATH,
  //         data: jsonEncode(data),
  //         options: Options(headers: {'X-Hash': hashedData}));
  //     return response;
  //   } on DioError catch (e) {
  //     print(e);
  //     return e.response;
  //   } catch (e) {
  //     print(e);
  //     return null;
  //   }
  // }
}

final RedeemApi redeemApi = RedeemApi();
