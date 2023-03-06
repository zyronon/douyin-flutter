import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:hope/pages/components/BasePage.dart';
import 'package:hope/pages/components/common.dart';
import 'package:video_player/video_player.dart';
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
    extents = List<int>.generate(10000, (int index) => rnd.nextInt(5) + 1);
  }

  @override
  Widget build(BuildContext context) {
    return MasonryGridView.count(
      crossAxisCount: crossAxisCount,
      mainAxisSpacing: 4,
      crossAxisSpacing: 4,
      itemBuilder: (context, index) {
        final height = extents[index] * 100;
        return ImageTile(
          index: index,
          width: 100,
          height: height,
        );
      },
      itemCount: extents.length,
    );
  }
}
