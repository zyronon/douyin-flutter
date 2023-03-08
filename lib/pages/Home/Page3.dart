import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:hope/pages/components/PreviewCard.dart';

export '';

/// Stateful widget to fetch and then display video content.
class Page3 extends StatefulWidget {
  const Page3({Key? key}) : super(key: key);

  @override
  _Page3 createState() => _Page3();
}

class _Page3 extends State<Page3> {
  final rnd = Random();
  late List<int> extents = [];
  int crossAxisCount = 2;

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
    return MasonryGridView.count(
      padding: EdgeInsets.only(left: 4.w, right: 4.w),
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
    );
  }
}
