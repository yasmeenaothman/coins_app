import 'dart:io';

import 'package:coins_app/Repo/favourite_repo.dart';
import 'package:coins_app/app/constants.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../../Repo/currency_repo.dart';
import '../../../api/dio_helper.dart';
import '../../../main.dart';
import '../../../model/t_currency.dart';

class CoinsListController extends GetxController {
  List<Currency> allCurrencies = [];
  List<Currency> favouriteCurrencies = [];
  bool isLoading = false;
  int pageNum = 1;
  bool hasMore = true;
  bool isConnect = true;
  ScrollController scrollController = ScrollController();
  ScrollController scrollControllerFavourite = ScrollController();
  Currency? selectedCurrency;
  getAllCurrencies() async {
    isLoading = true;
    update();
    Map<String,dynamic>map = {
      'i_items_on_page': 30,
      'i_current_page': pageNum
    };
    try{
      allCurrencies = await CurrencyRepo.getCurrencyRequest(map);
      isLoading  = false;
      update();
    }
    catch(e){
      isConnect = false;
      update();
    }
  }
  getFavouriteList() async {
    //favouriteCurrencies = await FavouriteRepo.getFavouriteRequest();
    favouriteCurrencies = objectBox.getFavouriteList();
    update();
  }
  /*addFavouriteTest(Currency currency){
    objectBox.insertCurrencyToFavourite(currency);
    getFavouriteList();
  }*/
 /* deleteFavouriteTest(Currency currency){
    favouriteCurrencies.remove(currency);
    getFavouriteList();
    update();
  }
  postFavouriteList(String currencyName, String udid) async {
    Map<String,dynamic>map = {
      's_currency': currencyName,
      's_udid': udid
    };
    await FavouriteRepo.postFavouriteRequest(map);
    getFavouriteList();
  }*/

  insertCurrencyToFavourite(Currency currency){
    if(favouriteCurrencies.length < 4){
      objectBox.insertCurrencyToFavourite(currency);
      getFavouriteList();
      update();
    }
  }
  deleteFromFavourite(Currency currency){
    objectBox.deleteFromFavourite(currency.pkIId);
    getFavouriteList();
    update();

  }


  loadMoreTrigger(){
    scrollController.addListener(()=>loadMore(scrollController));
    scrollControllerFavourite.addListener(()=>loadMore(scrollControllerFavourite));
  }
  loadMore(ScrollController scrollController) async {
    if(scrollController.position.maxScrollExtent == scrollController.position.pixels){
      if(!hasMore)return;
      ++pageNum;
      //isLoading = true;
      //update();
      Map<String,dynamic>map = {
        'i_page_count': 30,
        'i_page_number': pageNum
      };
      List<Currency> list = [];
      list = await CurrencyRepo.getCurrencyRequest(map);
      list.isEmpty?hasMore = false: allCurrencies.addAll(list);
      //isLoading = false;
      update();
    }
  }

  Future<void> onRefresh() async{
    allCurrencies.clear();
    update();
    pageNum = 1;
    hasMore = true;
    isLoading = false;
    await getAllCurrencies();
    update();
  }
  static Future<String?> _getId() async {
    var deviceInfo = DeviceInfoPlugin();
    if (Platform.isIOS) { // import 'dart:io'
      var iosDeviceInfo = await deviceInfo.iosInfo;
      return iosDeviceInfo.identifierForVendor; // unique ID on iOS
    } else if(Platform.isAndroid) {
      var androidDeviceInfo = await deviceInfo.androidInfo;
      Constants.udid = androidDeviceInfo.androidId;
      return Constants.udid; // unique ID on Android
    }
  }
  @override
  void onInit() {
    getAllCurrencies();
    loadMoreTrigger();
    getFavouriteList();
    _getId();
    super.onInit();
  }
}