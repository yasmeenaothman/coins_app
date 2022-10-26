import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../app/constants.dart';
import '../../../app/theme/app_text_style.dart';

PreferredSizeWidget buildCustomAppBar(){
  return AppBar(
    backgroundColor: Colors.white,
    titleSpacing: 0,
    elevation: 0,
    titleTextStyle: AppTextStyles.swissraNormalGray9,
    title: Container(
      height: 41.h,
      padding: EdgeInsetsDirectional.only(
          start: 50.w, end: 11.w, top: 11.h),
      color: const Color(0xFFF8F9FB),
      child: Row(
        children: const [
          Expanded(child:Text(Constants.coin)),
          Expanded(child:Text(Constants.price)),
          Text(Constants.crypto),
        ],
      ),
    ),
  );
}