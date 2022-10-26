import 'package:coins_app/app/constants.dart';
import 'package:coins_app/app/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'alarm/coins_alarm_screen.dart';
import 'coins prices/coins_prices.dart';
import 'news&repoorts/news_screen.dart';

class BasicScreen extends StatefulWidget {
  const BasicScreen({Key? key}) : super(key: key);

  @override
  State<BasicScreen> createState() => _BasicScreenState();
}

class _BasicScreenState extends State<BasicScreen> {
  int selectedScreenIndex = 0;
  final list = [
    CoinsPricesScreen(),
    CoinsAlarmScreen(),
    NewsAndReportsScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: SafeArea(
          child: list[selectedScreenIndex],
        ),
        bottomNavigationBar: BottomNavigationBar(
          selectedLabelStyle: AppTextStyles.swissraBoldBlack8,
          unselectedLabelStyle: AppTextStyles.sfpRegularGray8.copyWith(fontFamily: 'swissra_bold' ),
          selectedItemColor: Colors.black,
          currentIndex: selectedScreenIndex,
          onTap: (index){
            setState(() {
              selectedScreenIndex = index;
            });
          },
          items: [
            _buildBottomNavigationItem(
                activeIconName: 'coins_prices_active',
                iconName:'coins_prices',
                label: Constants.coinsPrices
            ),
            _buildBottomNavigationItem(
                activeIconName: 'alarm_active',
                iconName:'alarm',
                label: Constants.coinsAlarm
            ),
            _buildBottomNavigationItem(
                activeIconName: 'news_active',
                iconName:'news',
                label: Constants.newsAndReports
            ),
          ],
        ),
      ),
    );
  }
  BottomNavigationBarItem _buildBottomNavigationItem({ required String activeIconName, required String iconName, required String label}){
    return BottomNavigationBarItem(
      icon:Padding(
        padding: EdgeInsets.symmetric(vertical: 12.h),
        child: SvgPicture.asset('${Constants.imgBaseURL}$iconName.svg',
        fit: BoxFit.none,
        ),
      ),
      label: label,
      activeIcon: Padding(
        padding: EdgeInsets.symmetric(vertical: 12.h),
        child: SvgPicture.asset('${Constants.imgBaseURL}$activeIconName.svg',fit: BoxFit.none,),
      ),
    );
  }
}
