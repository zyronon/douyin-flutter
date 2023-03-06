import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hope/pages/Home/index.dart';
import 'package:hope/pages/Login.dart';
import 'package:hope/pages/Me.dart';
import 'package:hope/pages/PrivacyPolicy.dart';
import 'package:hope/pages/Search.dart';
import 'package:hope/pages/Service.dart';
import 'package:hope/pages/ServiceAgreement.dart';
import 'package:hope/pages/VideoList.dart';

void main() async {
  await ScreenUtil.ensureScreenSize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);

    return ScreenUtilInit(
        designSize: const Size(350, 700),
        minTextAdapt: true,
        builder: (context, child) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.blue,
              pageTransitionsTheme: const PageTransitionsTheme(
                builders: <TargetPlatform, PageTransitionsBuilder>{
                  TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
                  TargetPlatform.android: CupertinoPageTransitionsBuilder(),
                },
              ),
            ),
            routes: {
              'Login': (context) => const Login(),
              'Home': (context) => const Home(),
              'ServiceAgreement': (context) => const ServiceAgreement(),
              'PrivacyPolicy': (context) => const PrivacyPolicy(),
              'Search': (context) => const Search(),
              'Service': (context) => const Service(),
              'VideoList': (context) => const VideoList(),
              '/': (context) => const Home(),
            },
          );
        });
  }
}
