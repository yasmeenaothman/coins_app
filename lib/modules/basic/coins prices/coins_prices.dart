import 'package:coins_app/app/constants.dart';
import 'package:coins_app/app/dummy_data.dart';
import 'package:coins_app/app/theme/app_text_style.dart';
import 'package:coins_app/modules/basic/coins%20prices/list_item.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart' hide TextDirection;

import '../../../app/widgets/shared_widgets.dart';
import '../../../model/t_currency.dart';
import 'coins_prices_controller.dart';
import 'custom_app_bar.dart';

class CoinsPricesScreen extends StatelessWidget {
  CoinsPricesScreen({Key? key}) : super(key: key);
  final date = DateFormat('d-M-y').format(DateTime.now());
  final controller = Get.put(CoinsListController(),permanent: true);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CoinsListController>(
      builder: (controller)=>controller.isLoading && controller.isConnect?const Center(child: CircularProgressIndicator())
          :!controller.isConnect?const Center(child: Text('Please sure you are connected with internet')):RefreshIndicator(
        onRefresh: controller.onRefresh,
        child: CustomScrollView(
          controller: controller.scrollController,
          slivers: [
            SliverAppBar(
              pinned: true,
              floating: true,
              snap: true,
              expandedHeight: 345.h,//338.h,
              backgroundColor: Colors.white,
              flexibleSpace: FlexibleSpaceBar(
                background: SizedBox(
                  width: double.infinity,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                  Padding(
                  padding: EdgeInsetsDirectional.only(start: 30.w),
                  child: const Text(
                    'أسعار العملات الالكترونية',
                    style: AppTextStyles.swissraBoldBlack20,
                  ),
                ),
                  const SizedBox(
                    height: 4,
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.only(start: 30.w),
                    child: Text(
                      'اخر تحديث:    $date',
                      style: AppTextStyles.swissraThinGrey12,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 26.w, vertical: 10.h),//16
                    child: Wrap(
                      spacing: 10.w,
                      runSpacing: 10.h,
                      children: [
                        ...controller.favouriteCurrencies
                            .map(
                              (e) => SharedWidget.buildColoredContainer(
                            colorList: Constants.listOfColorList[
                            controller.favouriteCurrencies.indexOf(e)],
                            height: 96.h,
                            width: 155.w,
                            child: _buildContainerChild(e,context),
                          ),
                        ).toList(),

                        Visibility(
                          visible: controller.favouriteCurrencies.length < 4,
                          child: InkWell(
                            /// TODO: this navigator take it from rout helper
                            onTap: ()=>Navigator.of(context).pushNamed(Constants.chooseFavouriteCurrencyScreen),
                            child: SharedWidget.buildColoredContainer(
                              height: 96.h,
                              width: 155.w,
                              child: _buildAddItem(),
                            ),
                          ),
                        ),
                      ],

                    ),
                  ),
                      ]
                  ),
                ),
              ),
              bottom: buildCustomAppBar(),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(

                    (_, int index) {
                  return ListItem(currency:controller.allCurrencies[index]);
                },
                childCount: controller.allCurrencies.length,//DummyData.allCoins.length,
              ),
            ),
          ],
        ),
      ),
    );

  }

  Widget _buildContainerChild(Currency currency,BuildContext context) {
    return InkWell(
      onTap: () {
        if(!(controller.favouriteCurrencies.length <4)){
          controller.deleteFromFavourite(currency);
        }
        Navigator.of(context).pushNamed(Constants.chooseFavouriteCurrencyScreen);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 30.h,
            width: 30.w,
            //TODO: take image form model
            child: ExtendedImage.network(
              currency.sIcon,
              height: double.infinity,
            ),
          ),
          SizedBox(
            height: 2.h,
          ),

          //TODO: take data form model

          Text(
            currency.sCode,
            style: AppTextStyles.swissraBoldWhite10,
          ),

          //TODO: use riggex experstion

          Text(
            '\$  ${currency.dValue}',
            style: AppTextStyles.swissraBoldWhite10,
          ),
        ],
      ),
    );
  }

  Widget _buildAddItem(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset('${Constants.imgBaseURL}add.svg'),
        SizedBox(height: 8.h,),
        Text(Constants.add,style: AppTextStyles.swissraBoldWhite10.copyWith(color: Constants.addTextColor),)
      ],
    );
  }

  /*Widget _buildListItem(Currency currency){
    return Padding(
      padding:  EdgeInsetsDirectional.only(start: 2.w,end: 8.w,top: 20.h),
      child: Row(
        children: [
          Text('${controller.allCurrencies.indexOf(currency) +1}',style: AppTextStyles.sfpRegularGray8,),
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
                SvgPicture.asset(Constants.imgBaseURL+(currency.bEnabled?'up.svg':'down.svg')),//coin.state
                SizedBox(width: 5.w,),
                Text('${(double.parse(currency.dTrading)*100).toStringAsFixed(2)}%',style: currency.bEnabled?AppTextStyles.sfpRegularGreen11:AppTextStyles.sfpRegularRed11,),//coin.desc
              ],
            ),
          ),
        ]
      ),
    );
  }*/
}
