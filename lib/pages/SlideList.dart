import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:hope/model/video.dart';
import 'package:hope/pages/SlideItem.dart';
import 'package:hope/pages/components/BasePage.dart';

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
        list = res.data['data'].map<Widget>((i) => SlideItem(video: Video.fromRawJson(i))).toList();
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
      controller: _PageController,
      scrollDirection: Axis.vertical,
      allowImplicitScrolling: true,
      // scrollDirection: Axis.vertical, // 滑动方向为垂直方向
      children: list,
    ));
  }
}

// Tab 页面
class Page extends StatefulWidget {
  const Page({Key? key, required this.video}) : super(key: key);

  final Video video;

  @override
  _PageState createState() => _PageState();
}

class _PageState extends State<Page> {
  @override
  Widget build(BuildContext context) {
    print("build ${widget.video.desc}");
    return Center(child: Text("${widget.video.desc}", textScaleFactor: 5));
  }
}
