import 'package:coins_app/modules/basic/coins%20prices/list_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'coins_prices_controller.dart';
import 'custom_app_bar.dart';


class ChooseFavouriteCurrencyScreen extends StatelessWidget {
  const ChooseFavouriteCurrencyScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CoinsListController>();
    return GetBuilder<CoinsListController>(
      builder: (controller)=>Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: buildCustomAppBar(),
          body: SafeArea(
            child: GetBuilder<CoinsListController>(
              builder: (controller)=> ListView.builder(
                //TODO:here use another scroll
                //controller: controller.scrollControllerFavourite,
                itemCount: controller.allCurrencies.length,
                itemBuilder: (context,index)=>ListItem(currency:controller.allCurrencies[index],isHome: false,),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
