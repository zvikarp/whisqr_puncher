import 'package:dio/dio.dart';

import 'package:whisqr_puncher/models/user.dart';
import 'package:whisqr_puncher/utils/api/business.dart';
import 'package:whisqr_puncher/utils/api/user.dart';
import 'package:whisqr_puncher/utils/storage.dart';

class ApiUtil {
  Dio dio = Dio(BaseOptions());
  UserApi user = userApi;
  BusinessApi business = businessApi;

  Future<void> setHeaders() async {
    User user = await storageUtil.getUser();
    dio.options.headers["X-Public"] = user.pk;
    dio.options.headers["Content-Type"] = 'application/json';
  }
}

final ApiUtil apiUtil = ApiUtil();
