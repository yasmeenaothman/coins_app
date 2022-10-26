import 'package:dio/dio.dart';

import '../app/constants.dart';
import '../dio_helper.dart';
import '../model/t_currency.dart';

class FavouriteController{
  static Future<Response>addFavourite(Map<String,dynamic>map) {
    return  DioHelper().post(Constants.addFavouriteUrl,queryParameters: map);
  }
  static Future<Response>getFavouriteRequest() async{
    return DioHelper().get(Constants.getFavouriteUrl);
  }
}