import 'package:dio/dio.dart';

import 'app/constants.dart';

Dio DioHelper(){
  Dio dio = Dio();
  dio.options.baseUrl = Constants.apiBaseUrl;
  dio.options.connectTimeout = 5000;
  dio.options.headers = {
    'X-Client-Device-UDID':Constants.udid,
  };
  return dio;
}