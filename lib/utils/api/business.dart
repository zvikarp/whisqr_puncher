import 'package:dio/dio.dart';

import 'package:whisqr_puncher/consts/api.dart';
import 'package:whisqr_puncher/utils/api/index.dart';

class BusinessApi {
  Future<Response> getBehaviours() async {
    try {
      Response response =
          await apiUtil.dio.get(ApiConsts.BUSINESS_BEHAVIOURS_PATH);
      return response;
    } on DioError catch (e) {
      print(e);
      return e.response;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<Response> getRewards() async {
    try {
      Response response =
          await apiUtil.dio.get(ApiConsts.BUSINESS_REWARDS_PATH);
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

final BusinessApi businessApi = BusinessApi();
