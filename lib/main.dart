import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'pages/Home/index.dart';
import 'pages/Login.dart';
import 'pages/order/OrderDetail.dart';
import 'pages/order/PlaceOrder.dart';
import 'pages/PrivacyPolicy.dart';
import 'pages/Search.dart';
import 'pages/Service.dart';
import 'pages/ServiceAgreement.dart';
import 'pages/SlideList.dart';
import 'pages/Test.dart';
import 'pages/UserList.dart';
import 'pages/UserPanel.dart';
import 'pages/order/MyOrders.dart';

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
        designSize: const Size(375, 750),
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
              'SlideList': (context) => const SlideList(),
              'UserPanel': (context) => const UserPanel(),
              'Test': (context) => const TestPage(),
              'MyOrders': (context) => const MyOrders(),
              'PlaceOrder': (context) => const PlaceOrder(),
              'OrderDetail': (context) => const OrderDetail(),
              'UserList': (context) => const UserList(),
              '/': (context) => const Home(),
            },
          );
        });
  }
}
