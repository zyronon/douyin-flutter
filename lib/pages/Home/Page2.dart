import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
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
  late List<int> extents = [];
  int crossAxisCount = 2;

  // DefaultTabController _tabController = DefaultTabController(length: 3, child: null,);

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() {
    Future.delayed(Duration(milliseconds: 200)).then((e) {
      setState(() {
        extents.addAll(List<int>.generate(10, (int index) => rnd.nextInt(2) + 1));
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
              child: BaseScrollView(
                  child: TabBarView(
            children: [
              Icon(Icons.directions_boat),
              MasonryGridView.count(
                padding: EdgeInsets.all(4.w),
                crossAxisCount: crossAxisCount,
                mainAxisSpacing: 4.w,
                crossAxisSpacing: 4.w,
                itemBuilder: (context, index) {
                  if (index == extents.length - 1) {
                    getData();
                  }
                  final height = extents[index] * 100;
                  return PreviewCard(
                    index: index,
                    width: 100,
                    height: height,
                  );
                },
                itemCount: extents.length,
              ),
              Icon(Icons.directions_car),
            ],
          )))
        ],
      ),
    );
  }
}
