import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart' hide TextDirection;
import '../../../app/constants.dart';
import '../../../app/theme/app_text_style.dart';
import '../../../model/t_currency.dart';
import 'news_controller.dart';
class NewsAndReportsScreen extends StatelessWidget {
  NewsAndReportsScreen({Key? key}) : super(key: key);
  final controller = Get.put(NewsController(),permanent: true);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.only(start: 30.w),
            child: const Text(
              Constants.newsAndReports,
              style: AppTextStyles.swissraBoldBlack20,
            ),
          ),
          SizedBox(height: 5.h,),
          GetBuilder<NewsController>(
            builder: (controller)=>Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal:21.w),
                child: controller.news.isEmpty?const CircularProgressIndicator():ListView.builder(
                  shrinkWrap: true,
                  itemBuilder: (context,index)=>_buildListItem(controller.news[index]),
                  itemCount: controller.news.length,
                ),
              ),
            ),
          ),
        ],
      ),
    );

  }
  Widget _buildListItem(News news){
    return InkWell(
      onTap: () {
        controller.updateSelectedNews(news);
        Get.toNamed(Constants.newsDetailsScreen);
      },
      child: Container(
        height: 107.h,
        padding: EdgeInsets.symmetric(horizontal: 8.w,vertical: 7.h),
        margin: EdgeInsets.only(bottom: 10.h,),
        decoration: getBoxDecoration(),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ExtendedImage.network(news.sImage,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(10.r),
              fit: BoxFit.fill,
              width: 123.w,
              height: double.infinity,
              cache: true,
            ),
            SizedBox(width: 11.w,),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 5.h),
                    child: Text(
                      news.sTitle,
                      style: AppTextStyles.sfpRegularBlack11.copyWith(fontFamily: 'swissra_bold'),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(height: 3.h,),
                  Text(Constants.dateFormat(news.dtCreatedDate),style: AppTextStyles.sfpRegularGray8.copyWith(color: Colors.black),),

                ],
              ),
            ),

        ]
        ),
      ),
    );

  }
  BoxDecoration getBoxDecoration({double radius = 15}){
    return BoxDecoration(
      //color: Constants.backgroundGrey,
      borderRadius: BorderRadius.circular(radius.r),
      border: radius==15?Border.all(color: Constants.borderGreyEA,width: 0.5.w):null,
    );
  }

}
