import 'dart:io';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hope/pages/components/BaseHeader.dart';
import 'package:hope/pages/components/BasePage.dart';
import 'package:hope/pages/components/BaseScrollView.dart';
import 'package:hope/utils/ConstVal.dart';

// 应用类
class Page4 extends StatefulWidget {
  const Page4({Key? key}) : super(key: key);

  @override
  _Page4 createState() => _Page4();
}

// 应用状态类
class _Page4 extends State<Page4> {
  @override
  void initState() {
    print('page4-initState');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const BaseHeader(title: '消费', showBack: false),
        Column(children: [
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, 'MyOrders');
            },
            child: Text('订单'),
          ),
        ])
      ],
    );
  }
}
