import 'package:dio/dio.dart';

import 'package:whisqr_puncher/utils/api/user.dart';

class ApiUtil {
  Dio dio = Dio(BaseOptions());
  UserApi user = userApi;
}

final ApiUtil apiUtil = ApiUtil();
