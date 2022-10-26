import 'package:coins_app/model/t_currency.dart';
import 'package:objectbox/objectbox.dart';

import '../objectbox.g.dart';

class ObjectBoxHelper {
  late final Store _store;
  late final Box<Currency> _currencyBox;
  // named constructor
  ObjectBoxHelper._(this._store) {
    _currencyBox = Box<Currency>(_store);
  }

  static Future<ObjectBoxHelper> init() async {
    final store = await openStore();
    return ObjectBoxHelper._(store);
  }

  List<Currency> getFavouriteList() => _currencyBox.getAll();
  int insertCurrencyToFavourite(Currency currency) => _currencyBox.put(currency);
  bool deleteFromFavourite(int id) => _currencyBox.remove(id);
}