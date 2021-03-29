import 'package:dio/dio.dart';

import 'package:whisqr_puncher/consts/api.dart';
import 'package:whisqr_puncher/utils/api/index.dart';

class UserApi {
  Future<Response> login(
      String email, String password, String _businessCode) async {
    try {
      Response response =
          await apiUtil.dio.post(ApiConsts.USER_LOGIN_PATH, data: {
        'email': email,
        'password': password,
        if (_businessCode != null) 'businesscode': _businessCode,
      });
      return response;
    } on DioError catch (e) {
      print(e);
      return e.response;
    } catch (e) {
      print(e);
      return Response(statusCode: 400);
    }
  }
}

final UserApi userApi = UserApi();
