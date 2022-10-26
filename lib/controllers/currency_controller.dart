import 'package:dio/dio.dart';

import '../app/constants.dart';
import '../dio_helper.dart';

class CurrencyController{
  static Future<Response>getCurrencies(Map<String,dynamic>map) {
    return  DioHelper().get(Constants.currencyUrl,queryParameters: map);
  }
}