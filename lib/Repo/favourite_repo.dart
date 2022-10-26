import '../controllers/currency_controller.dart';
import '../controllers/favourite_controller.dart';
import '../model/t_currency.dart';

class FavouriteRepo{
  static postFavouriteRequest(Map<String,dynamic>map) async{
    final response =  await FavouriteController.addFavourite(map);
    if(response.statusCode==200){
      print('done');
    }
  }
  static Future<List<Currency>> getFavouriteRequest() async{
    List<Currency> favouriteCurrencies = [];
    final response =  await FavouriteController.getFavouriteRequest();
    if(response.statusCode==200){
      (response.data['favourites'] as List).forEach((e) { favouriteCurrencies.add(Currency.fromJson(e)); });
    }
    return favouriteCurrencies;
  }
}