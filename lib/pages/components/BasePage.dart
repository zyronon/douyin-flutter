import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

export '';

class BasePage extends StatefulWidget {
  const BasePage({super.key, required this.child});

  final Widget child;

  @override
  State<StatefulWidget> createState() {
    return _BasePage();
  }
}

class _BasePage extends State<BasePage> {
  final double stateHeight = MediaQueryData.fromWindow(window).padding.top;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: DefaultTextStyle(
            style: TextStyle(fontSize: 14.sp, color: Colors.white),
            child: Container(
              padding: EdgeInsets.only(top: stateHeight),
              decoration: const BoxDecoration(
                // color: Color.fromRGBO(15, 22, 33, 1),
                color: Colors.grey,
              ),
              child: widget.child,
            )));
  }
}
