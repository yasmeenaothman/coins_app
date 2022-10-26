import 'package:coins_app/helpers/object_box_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/get_navigation.dart';

import 'app/constants.dart';
import 'modules/splash/splash.dart';


late ObjectBoxHelper objectBox;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    )
  );
  objectBox = await ObjectBoxHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context){
    return ScreenUtilInit(
      designSize: Constants.size,
      builder: (_,child)=>GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: const SplashScreen(),
        routes: Constants.routes,
       /* localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate
        ],*/
        /*supportedLocales: const [
          Locale('ar'),
          Locale('en'),
        ],*/
      ),
    );
  }
}

