import 'dart:convert';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:hope/model/args.dart';
import 'package:hope/model/video.dart';
import 'package:hope/model/woman.dart';
import 'package:hope/pages/components/BaseScrollView.dart';
import 'package:hope/pages/components/PreviewCard.dart';

export '';

class Page2 extends StatefulWidget {
  const Page2({super.key});

  @override
  State<StatefulWidget> createState() => _Page2();
}

class _Page2 extends State<Page2> {
  final rnd = Random();
  late List<VideoModel> list = [];
  int crossAxisCount = 2;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    // Dio dio = Dio();
    // var res = await dio.get("http://172.16.1.17:3000/slideList");
    // res.data = jsonDecode(res.data);
    // if (res.data['code'] == 200) {
    //   setState(() {
    //     list = res.data['data'].asMap().entries.map<VideoModel>((entry) {
    //       return VideoModel.fromRawJson(entry.value);
    //     }).toList();
    //   });
    // }
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
    return DefaultTabController(
      length: 3,
      child: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Material(
                //这里设置tab的背景色
                  color: Colors.red,
                  child: TabBar(
                    padding: EdgeInsets.only(left: .2.sw, right: .2.sw),
                    indicatorPadding: EdgeInsets.only(left: 15.w, right: 15.w),
                    tabs: const [
                      Tab(icon: null, text: "附近"),
                      Tab(icon: null, text: "推荐"),
                      Tab(icon: null, text: "关注"),
                    ],
                  )),
              Positioned(
                right: 15.w,
                child: InkWell(
                  onTap: () => {Navigator.pushNamed(context, 'Search')},
                  child: Icon(
                    Icons.search,
                    color: Colors.white,
                    size: 25.w,
                  ),
                ),
              )
            ],
          ),
          Expanded(
              child: TabBarView(
                children: [
                  MasonryGridView.count(
                    padding: EdgeInsets.all(4.w),
                    crossAxisCount: crossAxisCount,
                    mainAxisSpacing: 4.w,
                    crossAxisSpacing: 4.w,
                    itemBuilder: (context, index) {
                      if (index == list.length - 1) {
                        getData();
                      }
                      return InkWell(
                        onTap: () => {Navigator.pushNamed(context, 'SlideList', arguments: SlideListArguments(list, index))},
                        child: PreviewCard(
                          index: index,
                          item: list[index],
                        ),
                      );
                    },
                    itemCount: list.length,
                  ),
                  const Icon(Icons.directions_boat),
                  const Icon(Icons.directions_car),
                ],
              ))
        ],
      ),
    );
  }
}
