
import 'dart:ui';

import 'package:coins_app/modules/basic/basic_screen.dart';
import 'package:coins_app/modules/basic/news&repoorts/news_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../modules/basic/alarm/coins_alarm_screen.dart';
import '../modules/basic/coins prices/choose_favourite_currency_page.dart';
import '../modules/basic/coins prices/coins_prices.dart';
import '../modules/basic/news&repoorts/news_detailes_page.dart';
import '../modules/splash/splash.dart';
class Constants{
  static const size = Size(375,812);
  static final date = DateFormat('dd/MM/y').format(DateTime.now());
  static final dateyMMMMd = DateFormat.yMMMMd('ar').format(DateTime.now());
  static String? udid;
  //I will send their index to api with request
  static const List<String> dropItems = ['غير معروف','أقل من', 'يسـاوي', 'أكبر من'];
  // routes name
  static const splashScreen = '/splashScreen';
  static const basicScreen = '/basicScreen';
  static const coinsPricesScreen = '/coinsPricesScreen';
  static const coinsAlarmScreen = '/coinsAlarmScreen';
  static const newsAndReportsScreen = '/newsAndReportsScreen';
  static const newsDetailsScreen = '/newsDetailsScreen';
  static const chooseFavouriteCurrencyScreen = '/chooseFavouriteCurrencyScreen';
  // alignment
  static const centerRight = Alignment.centerRight;
  static const centerLeft = Alignment.centerLeft;
  static const topCenter = Alignment.topCenter;
  static const bottomCenter = Alignment.bottomCenter;

  // routes
  static final routes = {
    splashScreen : (_)=> const SplashScreen(),
    basicScreen : (_)=> const BasicScreen(),
    coinsPricesScreen : (_)=> CoinsPricesScreen(),
    coinsAlarmScreen : (_)=> CoinsAlarmScreen(),
    newsAndReportsScreen : (_)=> NewsAndReportsScreen(),
    newsDetailsScreen : (_)=> const NewsDetailsScreen(),
    chooseFavouriteCurrencyScreen : (_)=> const ChooseFavouriteCurrencyScreen(),
  };

  // lists of colors
  //TODO:ensure from these colors
  static const colorList1 = [
    Color(0XFFFFA500),
    //Color(0XFFFFA500),
    Color(0XFFFFDB00),
  ];
  static const colorList2 = [
    Color(0XFF47E546),
    Color(0XFF02DFB6),
  ];
  static const colorList3 = [
    Color(0XFFFB79B4),
    Color(0XFF9B81EC),
    Color(0XFF9B81EC),
  ];
  static const colorList4 = [
    Color(0XFF478EDA),
    Color(0XFF58C4D8),
  ];
  static const listOfColorList = [colorList1,colorList3,colorList4,colorList2];
  static const imgBaseURL = 'assets/images/';

  //colors
  static const borderGrey = Color(0xFFF4F4F4);
  static const borderGreyEA = Color(0xFFEAEAEA);
  static const backgroundGrey = Color(0xFFD8D8D8);
  static const btnBgBlueFacebook = Color(0xFF2D609B);
  static const btnBgBlueTwitter = Color(0xFF00C3F3);
  static const addTextColor = Color(0x2E434343);
  static const addContainerBg = Color(0xFFF9F9FA);
  static const dividerColor = Color(0xFFF8F9FB);
  static const dropDownColor = Color(0xFF9C9C9C);

  //strings
  static const newsAndReports = 'اخبـار وتقارير';
  static const coinsAlarm = 'منبه العملات';
  static const coinsPrices = 'أسعار العملات';
  static const coin = 'العملة';
  static const price = 'السعر';
  static const crypto = 'التداول';
  static const chooseType = 'يرجى اختيـار نوع العملة';
  static const chooseValue = 'يرجى تحديد قيمة المنبه';
  static const back = 'عودة';
  static const share = 'مشاركة';
  static const addAlarm = 'اضـــافة تنبيه';
  static const add = 'اضغط للاضافة';
  static const shareViaFace = 'مشاركة عبر فيسبوك';
  static const shareViaTwitter = 'مشاركة عبر تويتر';
  static const title = 'انتعاش في قيمة العملات الرقمية الرئيسية تمثلت بارتفاع كل من البيتكوين والاثيريوم وكاردانو';
 // static const title = 'انتعاش في قيمة العملات الرقمية الرئيسية تمثلت بارتفاع كل من البيتكوين والاثيريوم وكاردانو';
  static const subTitle = 'باستثناء عملة الريبل والتي أظهرت أداءاً ضعيفاً طوال الأسابيع القليلة الماضية، فإن العملات الرقمية الرئيسية في السوق بما في ذلك البيتكوين والاثيريوم وكاردانو قد ارتفعت قيمتها. وفي غضون الـ 24 ساعة الماضية، ازداد سعر البيتكوين بنسبة 8% وارتفعت قيمة الإيثر بنسبة 10%، كما وارتفعت قيمة كاردانو بنسبة 15%. وبينما انخفض سعر العملات الثلاث بهامش ضئيل في الثلاث ساعات الماضية، إلا أنهم لا زالوا يسجلون مكاسب يومية كبيرة نسبياً.';

  //urls
  static const imageUrl = 'https://cdn.gobankingrates.com/wp-content/uploads/2019/07/bitcoin-cryptocurrency-iStock-879153690.jpg';
  static const apiBaseUrl = 'https://newline.dev/currency/api/v1/';
  static const currencyUrl = 'currencies/list';
  static const addFavouriteUrl = 'favourites';
  static const getFavouriteUrl = 'favourites/list';
  static const addTriggerUrl = 'triggers';
  static const getTriggerUrl = 'triggers/list';
  static const deleteTriggerUrl = 'triggers?id=';

  //
  static String dateFormat(date){
    return DateFormat.yMd().format(date);
  }
}