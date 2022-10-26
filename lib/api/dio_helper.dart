import 'package:coins_app/model/t_currency.dart';
import 'package:dio/dio.dart';

import '../app/constants.dart';

class ApiHelper{
  ApiHelper._();
  static ApiHelper apiHelper = ApiHelper._();
  Dio dio = Dio();
  Future<List<Currency>>getAllCurrencies() async{
    String url = '${Constants.apiBaseUrl}currencies/list';
    List<Currency> allCurrencies = [];
    Response response = await dio.get(url);
    if(response.statusCode==200){
      allCurrencies = BaseResponse.fromJson(response.data).currencies;
    }
    return allCurrencies;
  }
  Future<List<Currency>>getFavouriteList() async{
    String url = '${Constants.apiBaseUrl}favourites/list';
    List<Currency> favouriteCurrencies = [];
    Response response = await dio.get(url);
    if(response.statusCode==200){
      (response.data['favourites'] as List).forEach((e) { favouriteCurrencies.add(Currency.fromJson(e)); });
    }
    return favouriteCurrencies;
  }
  Future<List<News>>getNews() async{
    String url = '${Constants.apiBaseUrl}news/list';
    List<News> news = [];
    Response response = await dio.get(url);
    if(response.statusCode==200){
      (response.data['news'] as List).forEach((e) { news.add(News.fromJson(e)); });
    }
    return news;
  }
}