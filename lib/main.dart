import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_example2/pages/home_page.dart';

import 'pages/counter_page.dart';
import 'pages/hide_appbar_bottombar/animated_hide_appbar_bottombar.dart';
import 'pages/hide_appbar_bottombar/hide_appbar_bottombar.dart';
import 'pages/test_getx/simple_state_management/counter_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return GetMaterialApp(
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // home: CounterPage(),
      // home: HideAppbarOrBottomBar(),
      // home: AnimatedHideAppbarAndBottomBar(Name()),
      // home: HomePage(),
      home: CounterGetX(),

    );
  }
}

