import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:hope/model/video.dart';
import 'package:hope/pages/SlideItem.dart';
import 'package:hope/pages/components/BasePage.dart';
import 'package:hope/utils/EventBus.dart';

export '';

class SlideList extends StatefulWidget {
  const SlideList({super.key});

  @override
  _SlideListState createState() => _SlideListState();
}

class _SlideListState extends State<SlideList> {
  final PageController _PageController = PageController();
  List<Widget> list = <Widget>[];

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  void dispose() {
    _PageController.dispose();
    super.dispose();
  }

  getData() async {
    Dio dio = Dio();
    var res = await dio.get("http://172.16.1.17:3000/");
    res.data = jsonDecode(res.data);
    if (res.data['code'] == 200) {
      setState(() {
        list = res.data['data'].asMap().entries.map<Widget>((entry) {
          return SlideItem(
            video: Video.fromRawJson(entry.value),
            index: entry.key,
            isPlay:3 == entry.key
          );
        }).toList();
        _PageController.jumpToPage(3);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // var args=ModalRoute.of(context)?.settings.arguments;
    // print(args);
    return BasePage(
        child: PageView(
      onPageChanged: (v) => {EventBus.emit("slideListPageChanged", v)},
      controller: _PageController,
      scrollDirection: Axis.vertical,
      allowImplicitScrolling: true,
      // scrollDirection: Axis.vertical, // 滑动方向为垂直方向
      children: list,
    ));
  }
}
