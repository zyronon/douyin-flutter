import 'dart:io';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hope/pages/SlideItem.dart';
import 'package:hope/pages/components/BaseHeader.dart';
import 'package:hope/pages/components/BasePage.dart';
import 'package:hope/pages/components/BaseScrollView.dart';
import 'package:hope/utils/ConstVal.dart';
import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hope/model/video.dart';

export '';

// 应用类
class Page4 extends StatefulWidget {
  const Page4({Key? key}) : super(key: key);

  @override
  _Page4 createState() => _Page4();
}

// 应用状态类
class _Page4 extends State<Page4> {
  final rnd = Random();
  late List<VideoModel> list = [];
  int crossAxisCount = 2;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() {
    rootBundle.loadString('assets/resource.json').then((data) {
      Map<String, dynamic> map = jsonDecode(data);
      setState(() {
        list = map['videos'].asMap().entries.map<VideoModel>((entry) {
          return VideoModel.fromRawJson(entry.value);
        }).toList();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: SlideItem(videoModel: list.first, index: 0, isPlay: false));
    return Column(
      children: [
        const BaseHeader(title: '消费', showBack: false),
        // ElevatedButton(
        //   onPressed: () {
        //     Navigator.pushNamed(context, 'MyOrders');
        //   },
        //   child: Text('订单1'),
        // ),
        // Text('订单1'),
        // Text('订单112'),
        // Text('订单112'),
      ],
    );
  }
}
