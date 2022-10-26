import 'package:coins_app/app/constants.dart';
import 'package:coins_app/app/widgets/shared_widgets.dart';
import 'package:coins_app/model/t_alarm.dart';
import 'package:coins_app/model/t_currency.dart';
import 'package:coins_app/modules/basic/coins%20prices/coins_prices_controller.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../app/theme/app_text_style.dart';
import '../shared_widgets/search_widget.dart';
import 'coins_alarm_controller.dart';

class CoinsAlarmScreen extends StatelessWidget {
  CoinsAlarmScreen({Key? key}) : super(key: key);
  //final textValue = '10,544.69';
  final TextEditingController _editingController = TextEditingController();
  final controller = Get.find<CoinsListController>();
  final coinAlarmController = Get.put(CoinsAlarmController());
  @override
  Widget build(BuildContext context) {
    coinAlarmController.suggestions = controller.allCurrencies;
    coinAlarmController.selectedCurrency = coinAlarmController.suggestions[0];
    return GetBuilder<CoinsAlarmController>(
      builder: (alarmController)=>SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.only(start: 32.5.w),
              child: const Text(
                Constants.coinsAlarm,
                style: AppTextStyles.swissraBoldBlack20,
              ),
            ),
            _buildText(Constants.chooseType),
            SizedBox(
              height: 9.h,
            ),
            Padding(
              padding: EdgeInsetsDirectional.only(start: 23.w, end: 29.w),
              child: _buildContainerWithBorder(
                  child: _buildContainerItemSelectionCoin(context)),
            ),
            SizedBox(
              height: 18.h,
            ),
            _buildText(Constants.chooseValue, start: 29),
            SizedBox(
              height: 9.h,
            ),
            Padding(
              padding: EdgeInsetsDirectional.only(start: 23.w, end: 29.w),
              child: _buildContainerWithBorder(
                  child: Row(
                    children: [
                      _buildCustomDropDownButton(),
                      const VerticalDivider(
                        width: 0,
                        color: Constants.backgroundGrey,
                      ),
                      _buildTextFiled(),

                    ],
                  ),),
            ),
            SizedBox(
              height: 21.h,
            ),
            _customElevatedButton(Constants.addAlarm),
            SizedBox(
              height: 31.5.h,
            ),
            const Divider(
              height: 0,
              thickness: 1,
              color: Constants.dividerColor,
            ),
            SizedBox(
              height: 20.5.h,
            ),
            Expanded(//No alerts yet
              child: alarmController.alarms.isEmpty ?
              SharedWidget.emptyWidget('! No alarms yet'):
              ListView.builder(
                shrinkWrap: true,
                itemCount: alarmController.alarms.length,//controller.allCurrencies.length,
                //Todo: this only testing
                itemBuilder: (context, index) => Padding(
                  padding: EdgeInsetsDirectional.only(
                      start: 26.w, end: 26.w, bottom: 12.h),
                  child: _buildContainerWithBorder(
                    height: 66.h,
                    child: _buildListItem(alarmController.alarms[index]),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );

  }

  Widget _buildContainerItemSelectionCoin(BuildContext context) {
    return InkWell(
      onTap: () {
        coinAlarmController.suggestions = controller.allCurrencies;
        showDialog(context: context, builder:(context)=>_buildAlertDialog());
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 17.w),
        child: Row(
          children: [
            ExtendedImage.network(
              coinAlarmController.selectedCurrency!.sIcon,
              height: 23,
              width: 23,
              clipBehavior: Clip.antiAliasWithSaveLayer,
            ),
            SizedBox(
              width: 14.w,
            ),
            Expanded(
              child: Text(
                '${coinAlarmController.selectedCurrency!.sName}  ${coinAlarmController.selectedCurrency!.sCode}',
                style: AppTextStyles.sfpMediumBlack12,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            SvgPicture.asset('${Constants.imgBaseURL}arrow.svg'),
          ],
        ),
      ),
    );
  }

  Widget _buildContainerWithBorder(
      {double height = 56, required Widget child}) {
    return Container(
      height: height.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Constants.borderGrey,
        ),
      ),
      child: child,
    );
  }

  Widget _buildListItem(TAlarm alarm) {
   // final dropValue = Constants.dropItems[1];
    Currency currency = controller.allCurrencies.firstWhere((currency) => currency.sCode == alarm.s_code);
    return Padding(
      padding: EdgeInsetsDirectional.only(
        start: 18.w,
        end: 22.w,
      ),
      child: Row(
        children: [
          ExtendedImage.network(
            currency.sIcon,
            height: 30,
            width: 30,
            clipBehavior: Clip.antiAliasWithSaveLayer,
          ),
          SizedBox(
            width: 16.w,
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${currency.sName}  ${currency.sCode}',
                style: AppTextStyles.sfpRegularGrayheavy11,
              ),
              SizedBox(
                height: 3.h,
              ),
              Text.rich(
                TextSpan(
                  text: '\$   ${alarm.d_value}   ',
                  children: [
                    TextSpan(
                      text: Constants.dropItems[alarm.i_type],//coinAlarmController.selectedDropItem,
                      style: const TextStyle(
                          fontSize: 10, fontFamily: 'swissra_bold'),
                    ),
                  ],
                ),
                style: Constants.dropItems[alarm.i_type] == Constants.dropItems[1]
                    ? AppTextStyles.sfpRegularRed11
                    : AppTextStyles.sfpRegularGreen11,
                textDirection: TextDirection.ltr,
              ),
            ],
          ),
          Expanded(
            child: InkWell(
              onTap: ()=> coinAlarmController.removeAlarm(alarm),
              child: Align(
                alignment: AlignmentDirectional.centerEnd,
                child: SvgPicture.asset('${Constants.imgBaseURL}delete.svg'),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildText(String text, {double start = 27}) {
    return Padding(
      padding: EdgeInsetsDirectional.only(start: start.w),
      child: Text(
        text,
        style: AppTextStyles.swissraNormalGray9,
      ),
    );
  }

  Widget _buildCustomDropDownButton() {
    return GetBuilder<CoinsAlarmController>(
      builder: (coinsController)=>DropdownButton<String>(
        value: coinsController.selectedDropItem,
        icon: Padding(
          padding:  EdgeInsetsDirectional.only(end: 17.5.w),
          child: SvgPicture.asset('${Constants.imgBaseURL}drop_down.svg',),
        ),
        underline: Container(),
        items: Constants.dropItems.map((e) =>DropdownMenuItem<String>(
          value: e,
          child: Padding(
            padding: EdgeInsetsDirectional.only(end: 45.0.w,start: 54.w),
            child: Text(
              e,
              style: AppTextStyles.swissraBoldBlack20.copyWith(fontSize: 11),
            ),
          ),
        )).toList(),
        onChanged: (e) =>coinsController.updateSelected(e!),
      ),
    );
  }

  Widget _customElevatedButton(String text) {
    return Padding(
      padding: EdgeInsetsDirectional.only(start: 23.w, end: 29.w),
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: Constants.colorList1,
            begin: AlignmentDirectional.centerStart,
            end: AlignmentDirectional.centerEnd,
          ),
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: ElevatedButton(
          onPressed: () {
            print('jjjjjjjjjj${Constants.udid}');
            coinAlarmController.addAlarm(
              TAlarm(
                s_code: coinAlarmController.selectedCurrency!.sCode,
                i_type: Constants.dropItems.indexOf(coinAlarmController.selectedDropItem),
                d_value: double.parse(_editingController.text.split('\$')[0]),
              ),
            );
            coinAlarmController.getAlarms();
            clearField();
          },
          style: ElevatedButton.styleFrom(
            primary: Colors.transparent,
            shadowColor: Colors.transparent,
            onSurface: Colors.transparent,
            fixedSize: Size(double.maxFinite, 55.h),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.r),
            ),
          ),
          child: Text(
            text,
            style: AppTextStyles.swissraBoldBlack8.copyWith(fontSize: 13),
          ),
        ),
      ),
    );
  }

  Widget _buildTextFiled(){
    return Expanded(
      child: TextField(
        controller: _editingController,
        textAlign: TextAlign.center,
        style: AppTextStyles.sfpRegularBlack11.copyWith(fontSize: 15),
        keyboardType: const TextInputType.numberWithOptions(decimal: true),
        decoration: const InputDecoration(
          border: OutlineInputBorder(borderSide: BorderSide.none),
          hintText: '0.0 \$ ',
        ),
        onTap: ()=>_editingController.clear(),
        onSubmitted: (value) {
          _editingController.text = '$value \$';
        },
      ),
    );
  }

  Widget _buildAlertDialog(){
    return GetBuilder<CoinsAlarmController>(
      builder: (alarmController)=>AlertDialog(
        content: Directionality(
          textDirection: TextDirection.rtl,
          child: SizedBox(
            width: 200.w,
            height: 400.h,
            child: Column(
              children: [
                _buildContainerWithBorder(
                  child: SearchWidget(
                    searchOperation: searchOperation
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Expanded(
                  child: alarmController.suggestions.isEmpty ?
                  SharedWidget.emptyWidget('No search results') :
                  ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (context,index)=> _buildDialogListItem(
                      context,
                      alarmController.suggestions[index]
                    ),
                    separatorBuilder: (context, index) => SizedBox(height: 20.h,),
                    itemCount: alarmController.suggestions.length,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDialogListItem(BuildContext context,Currency currency){
    return InkWell(
      onTap: (){
        Navigator.pop(context);
        coinAlarmController.updateSelectedCurrency(currency);
      },
      child: Row(
        children: [
          ExtendedImage.network(currency.sIcon,height: 18.h,),
          SizedBox(width: 20.w,),
          Expanded(
            child: Text.rich(
              TextSpan(
                text:'${currency.sCode}   ',//coin.name.split(' ')[0]
                children: [
                  TextSpan(text: currency.sName,style: const TextStyle(fontSize: 10),),//coin.name.split(' ')[1]
                ],
              ),
              style: AppTextStyles.sfpRegularBlack11,
              //overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
  void searchOperation(String query){
    final suggestions = controller.allCurrencies.where((currency) {
      final currencyCode = currency.sCode.toLowerCase();
      final input = query.toLowerCase();
      return currencyCode.contains(input);
    }).toList();
    coinAlarmController.updateSuggestions(suggestions);
  }
  clearField(){
    coinAlarmController.updateSelectedCurrency(controller.allCurrencies[0]);
    _editingController.clear();
    coinAlarmController.updateSelected(Constants.dropItems[3]);

  }
}
