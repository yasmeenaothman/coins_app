import 'package:flutter/material.dart';

import '../constants.dart';
import '../theme/app_text_style.dart';

class SharedWidget{
  static Widget buildColoredContainer({List<Color>? colorList,double? height,double? width,Widget? child}){
    return Container(
      height: height,//96.h,
      width: width,//155.w,
      decoration: BoxDecoration(
        borderRadius: height == null?null:BorderRadius.circular(8),
        color: colorList == null ? Constants.addContainerBg:null,
        gradient: colorList == null?null:LinearGradient(
          begin: height == null? Constants.topCenter: Constants.centerRight,
          end: height == null? Constants.bottomCenter: Constants.centerLeft,
          colors: colorList,
        ),
      ),
      child: height == null ?null:child ,
    );
  }
  static Widget emptyWidget(String msg){
    return  Center(child: Text(msg,style: AppTextStyles.sfpMediumBlack12,));
  }
}