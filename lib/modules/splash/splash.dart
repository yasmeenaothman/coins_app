import 'package:coins_app/app/theme/app_text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../app/widgets/shared_widgets.dart';
import '../../app/constants.dart';
import 'rectangle_painter.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3)).then((value) =>
        Navigator.of(context).pushReplacementNamed(Constants.basicScreen));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    //print(MediaQuery.of(context).size);
    return SafeArea(
      child: Scaffold(

        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Column(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Expanded(child: SharedWidget.buildColoredContainer(colorList: Constants.colorList3)),
                      Expanded(child: SharedWidget.buildColoredContainer(colorList: Constants.colorList1)),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      Expanded(child: SharedWidget.buildColoredContainer(colorList: Constants.colorList2)),
                      Expanded(child: SharedWidget.buildColoredContainer(colorList: Constants.colorList4)),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height/1.91,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'بلوك \nتشين ',
                    style: AppTextStyles.swissraBoldWhite20,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 83.h,),
                  _buildCustomPainter(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /*_buildColoredContainer(List<Color> colorList){
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: colorList,
        )
      ),
    );
  }*/

  _buildCustomPainter(){
    return Container(
      height: 135.h,
      width: 150.w,
      child: CustomPaint(
        painter: RectanglePainter(),
      ),
    );
  }
}

