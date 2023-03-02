import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hope/pages/Home/index.dart';
import 'package:hope/pages/Login.dart';
import 'package:hope/pages/PrivacyPolicy.dart';
import 'package:hope/pages/ServiceAgreement.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        'Login': (context) => const Login(),
        'Home': (context) => const Home(),
        'ServiceAgreement': (context) => const ServiceAgreement(),
        'PrivacyPolicy': (context) => const PrivacyPolicy(),
        '/': (context) => const Home(),
      },
    );
  }
}
