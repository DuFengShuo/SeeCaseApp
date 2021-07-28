import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foods_store_app/home/home_list_page.dart';
import 'package:foods_store_app/home/home_tab_page.dart';
import 'package:foods_store_app/res/colors.dart';
import 'package:foods_store_app/util/device_utils.dart';

void main() {
     if(Device.isAndroid){
       //透明状态栏
       const SystemUiOverlayStyle systemUiOverlayStyle =
       SystemUiOverlayStyle(statusBarColor: Colors.transparent);
       SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
     }


  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: Size(375, 812),
    // allowFontScaling: false,

    builder: () =>MaterialApp(
      title: 'SeeCaseApp',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    ));
  }
}
