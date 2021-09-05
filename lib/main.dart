import 'package:flutter/material.dart';
import 'package:mobigic_test_flutter/app/home/view/home_page.dart';
import 'package:mobigic_test_flutter/app/home/controller/home_page_controller.dart';
import 'package:mobigic_test_flutter/app/home/view/splash_screen.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
    );
  }
}