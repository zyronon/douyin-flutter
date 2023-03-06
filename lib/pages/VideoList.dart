import 'package:flutter/widgets.dart';
import 'package:hope/pages/components/BasePage.dart';

export '';

class VideoList extends StatefulWidget {
  const VideoList({super.key});

  @override
  _VideoList createState() => _VideoList();
}

class _VideoList extends State<VideoList> {
  PageController _PageController = new PageController(initialPage: 3);

  @override
  Widget build(BuildContext context) {
    var children = <Widget>[];
    // 生成 6 个 Tab 页
    for (int i = 0; i < 6; ++i) {
      children.add(Page(text: '$i'));
    }

    return BasePage(
        child: PageView(
      controller: _PageController,
      scrollDirection: Axis.vertical,
      allowImplicitScrolling: true,
      // scrollDirection: Axis.vertical, // 滑动方向为垂直方向
      children: children,
    ));
  }
}

// Tab 页面
class Page extends StatefulWidget {
  const Page({Key? key, required this.text}) : super(key: key);

  final String text;

  @override
  _PageState createState() => _PageState();
}

class _PageState extends State<Page> {
  @override
  Widget build(BuildContext context) {
    print("build ${widget.text}");
    return Center(child: Text("${widget.text}", textScaleFactor: 5));
  }
}
