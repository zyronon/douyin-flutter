import 'package:flutter/material.dart';
import 'package:hope/pages/home.dart';
import 'package:hope/pages/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        'login': (context) => const Login(title: '123123'),
        '/': (context) => const MyHomePage(title: 'Flutter Demo Home Page1111'),
      },
    );
  }
}
