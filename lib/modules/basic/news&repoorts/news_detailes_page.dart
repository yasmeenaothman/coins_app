import 'package:coins_app/app/constants.dart';
import 'package:coins_app/app/theme/app_text_style.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'news_controller.dart';

class NewsDetailsScreen extends StatelessWidget {
  const NewsDetailsScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          Expanded(
            child: Padding(
              padding: EdgeInsetsDirectional.only(start: 27.w,end: 34.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(Constants.share,style: AppTextStyles.swissraBoldBlack20.copyWith(fontSize: 12),),
                  InkWell(
                    onTap: ()=>Get.offNamed(Constants.basicScreen),
                    child: Text(
                    Constants.back,
                    style: AppTextStyles.swissraBoldBlack20.copyWith(fontSize: 12),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: SizedBox(
              width: double.infinity,
              child: GetBuilder<NewsController>(
                builder: (controller)=>Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 24.h,),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 27.w),
                      child: Text(
                        controller.selectedNews!.sTitle,
                        style: AppTextStyles.swissraBoldBlack20,
                        maxLines: 3,
                        overflow: TextOverflow.clip,
                      ),
                    ),
                    SizedBox(height: 3.h,),
                    Padding(
                      padding: EdgeInsetsDirectional.only(start: 30.w),
                      child: Text(Constants.dateFormat(controller.selectedNews!.dtCreatedDate),style: AppTextStyles.swissraNormalGray9.copyWith(fontSize: 10),),
                    ),
                    SizedBox(height: 11.h,),
                    ExtendedImage.network(controller.selectedNews!.sImage),
                    SizedBox(height: 14.h,),
                    SizedBox(
                      height: 28.h,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(width: 27.w,),
                          _customElevatedButton(Constants.shareViaFace),
                          SizedBox(width: 7.w,),
                          _customElevatedButton(Constants.shareViaTwitter,color: Constants.btnBgBlueTwitter),
                          SizedBox(width: 10.w,),
                          _buildSharedButton(),
                        ],
                      ),
                    ),
                    SizedBox(height: 5.h,),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 27.w),
                      child: Html(
                        data: controller.selectedNews!.sDescription,
                        //child: Text(controller.selectedNews!.sDescription,style: AppTextStyles.swissraNormalBlack11,)
                      ),
                    ),

                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
  Widget _buildSharedButton(){
    return Container(
      height: double.infinity,
      width: 29.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.r),
        color: Constants.backgroundGrey,
      ),
      child: SvgPicture.asset('${Constants.imgBaseURL}share.svg',fit: BoxFit.none,),
    );
  }
  Widget _customElevatedButton(String text, {Color color = Constants.btnBgBlueFacebook}){
    return ElevatedButton(
      onPressed: (){},
      style: ElevatedButton.styleFrom(
        primary: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4.r),
        ),
      ),
      child: Text(text,style: AppTextStyles.swissraNormalWhite10,),
    );
  }
}
