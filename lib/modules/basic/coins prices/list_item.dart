import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../app/constants.dart';
import '../../../app/theme/app_text_style.dart';
import '../../../model/t_currency.dart';
import 'coins_prices_controller.dart';

class ListItem extends StatelessWidget {
  ListItem({Key? key,required this.currency,this.isHome = true}) : super(key: key);
  Currency currency;
  bool isHome;
  final controller = Get.find<CoinsListController>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsetsDirectional.only(start: 2.w,end: 8.w,top: 20.h),
      child: GetBuilder<CoinsListController>(
        builder: (coinsController)=>Row(
            children: [
              Visibility(
                visible: !isHome,
                child: _buildCheckBox(currency,coinsController)
              ),
              Text('${coinsController.allCurrencies.indexOf(currency) +1}',style: AppTextStyles.sfpRegularGray8,),
              SizedBox(width: 5.w,),
              Expanded(child: ExtendedImage.network(currency.sIcon,height: 18.h,)),
              SizedBox(
                width: 80.w,
                child: Text.rich(
                  TextSpan(
                    text:'${currency.sCode}   ',//coin.name.split(' ')[0]
                    children: [
                      TextSpan(text: currency.sName,style: const TextStyle(fontSize: 10),),//coin.name.split(' ')[1]
                    ],
                  ),
                  style: AppTextStyles.sfpRegularBlack11,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(width: 20.w,),
              Expanded(
                flex: 2,
                child: Text.rich(
                  TextSpan(
                    text:'\$     ',
                    children: [
                      TextSpan(text: double.parse(currency.dValue).toStringAsFixed(2),style: const TextStyle(color: Colors.black)),//coin.price
                    ],
                  ),
                  style: AppTextStyles.sfpRegularGray11,
                  textAlign: TextAlign.center,
                  textDirection: TextDirection.ltr,
                ),
              ),
              Expanded(
                flex: 2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SvgPicture.asset(Constants.imgBaseURL+(true?'up.svg':'down.svg')),//coin.state
                    SizedBox(width: 5.w,),
                    Text('${(double.parse(currency.dTrading)*100).toStringAsFixed(2)}%',style: true?AppTextStyles.sfpRegularGreen11:AppTextStyles.sfpRegularRed11,),//coin.desc
                  ],
                ),
              ),
            ]
        ),
      ),
    );
  }
  Widget _buildCheckBox(Currency currency,CoinsListController coinsListController){
    return Checkbox(
      value: coinsListController.favouriteCurrencies.contains(currency),
      onChanged: (value){
        //TODO work with request
        value!?coinsListController.insertCurrencyToFavourite(currency):coinsListController.deleteFromFavourite(currency);
      },
    );
  }
}
