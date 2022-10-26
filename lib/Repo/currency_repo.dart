

import '../controllers/currency_controller.dart';
import '../model/t_currency.dart';

class CurrencyRepo{
  static Future<List<Currency>> getCurrencyRequest(Map<String,dynamic>map) async{
    List<Currency> allCurrencies = [];
    final response =  await CurrencyController.getCurrencies(map);
    if(response.statusCode==200){
      allCurrencies = BaseResponse.fromJson(response.data).currencies;
    }
    return allCurrencies;
  }
}