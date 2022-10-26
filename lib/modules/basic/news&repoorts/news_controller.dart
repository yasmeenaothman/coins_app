import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../../api/dio_helper.dart';
import '../../../model/t_currency.dart';

class NewsController extends GetxController {
  List<News> news = [];
  News? selectedNews;
  getNews() async {
    news = await ApiHelper.apiHelper.getNews();
    update();
  }
  updateSelectedNews(News selectedNews){
    this.selectedNews = selectedNews;
    update();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    getNews();
    super.onInit();
  }
}