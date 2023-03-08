import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hope/pages/components/BaseHeader.dart';
import 'package:hope/pages/components/BasePage.dart';
import 'package:hope/pages/components/MySliverAppBar.dart';
import 'package:hope/pages/components/PreviewCard.dart';
import 'package:hope/utils/ConstVal.dart';

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  State<StatefulWidget> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  List<int> _icons = []; //保存Icon数据
  String url = 'https://picsum.photos/200';

  @override
  void initState() {
    super.initState();
    // 初始化数据
    _retrieveIcons();
  }

  @override
  Widget build(BuildContext context) {
    return BasePage(
        child: Stack(
      children: [
        CustomScrollView(
          slivers: <Widget>[
            _buildBanner(),
            // SliverPersistentHeader(
            //   pinned: true, //是否固定在顶部
            //   delegate: _SliverAppBarDelegate2(
            //       minHeight: 50, //收起的高度
            //       maxHeight: 280, //展开的最大高度
            //       child: Container(
            //         padding: EdgeInsets.only(left: 16),
            //         color: Colors.pink,
            //         alignment: Alignment.centerLeft,
            //         child: Text("浮动", style: TextStyle(fontSize: 18)),
            //       )),
            // ),
            _buildStickyBar(),
            _buildList(),
          ],
        ),
        const BaseHeader(),
      ],
    ));
  }

  Widget _buildBanner() {
    return SliverToBoxAdapter(
        child: Container(
      padding: EdgeInsets.fromLTRB(18.w, headerHeight + 10.w, 18.w, 18.w),
      decoration: const BoxDecoration(image: DecorationImage(image: AssetImage('images/9.jpg'), fit: BoxFit.cover)),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 18.w, 0),
                child: CircleAvatar(
                  maxRadius: 35.w,
                  backgroundImage: NetworkImage(url),
                )),
            Expanded(
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                padding: EdgeInsets.only(bottom: 8.w, top: 8.w),
                child: Text(
                  "骗哥们可以",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: TextStyle(
                    fontSize: 16.sp,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 8.w),
                child: Text(
                  "账号:2131346",
                  style: TextStyle(fontSize: 10.sp, color: Colors.grey),
                ),
              ),
            ]))
          ],
        ),
        Padding(
          padding: EdgeInsets.only(top: 12.w),
          child: Text(
            "骗哥们可以",
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: TextStyle(
              fontSize: 14.sp,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 12.w),
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(5.w, 1.w, 5.w, 1.w),
                decoration: BoxDecoration(color: Colors.grey, borderRadius: BorderRadius.all(Radius.circular(3.w))),
                child: Text("女", style: TextStyle(color: Colors.white, fontSize: 8.sp)),
              )
            ],
          ),
        )
      ]),
    ));
  }

  Widget _buildStickyBar() {
    return SliverPersistentHeader(
      // pinned: true, //是否固定在顶部
      pinned: false, //是否固定在顶部
      delegate: _SliverAppBarDelegate(
          minHeight: 50, //收起的高度
          maxHeight: 50, //展开的最大高度
          child: Container(
            padding: EdgeInsets.only(left: 16),
            color: Colors.pink,
            alignment: Alignment.centerLeft,
            child: Text("浮动", style: TextStyle(fontSize: 18)),
          )),
    );
  }

  Widget _buildList2() {
    return SliverList(
        delegate: SliverChildBuilderDelegate(
      (context, index) {
        return Container(
          height: 50,
          color: index % 2 == 0 ? Colors.white : Colors.black12,
          width: double.infinity,
          alignment: Alignment.center,
          child: Text("我是第${index}个item"),
        );
      },
      childCount: 30,
    ));
  }

  Widget _buildList() {
    return SliverPadding(
      padding: const EdgeInsets.all(8.0),
      sliver: SliverGrid.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, //Grid按两列显示
          mainAxisSpacing: 10.0,
          crossAxisSpacing: 10.0,
          childAspectRatio: .6,
        ),
        itemCount: _icons.length,
        itemBuilder: (context, index) {
          // if (index == _icons.length - 1 && _icons.length < 200) {
          //   _retrieveIcons();
          // }
          return PreviewCard(index: index, width: 200, height: 200);
          return Container(
            alignment: Alignment.center,
            color: Colors.cyan[100 * (index % 9)],
            child: Text("index"),
          );
          // return Icon(_icons[index]);
        },
      ),
    );
  }

  //模拟异步获取数据
  void _retrieveIcons() {
    Future.delayed(Duration(milliseconds: 200)).then((e) {
      setState(() {
        for (int i = 0; i < 10; i++) {
          _icons.add(i);
        }
      });
    });
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  final double minHeight;
  final double maxHeight;
  final Widget child;

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => max(maxHeight, minHeight);

  // double get maxExtent => maxHeight;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate old) {
    return maxHeight != old.maxHeight || minHeight != old.minHeight || child != old.child;
  }
}

class _SliverAppBarDelegate2 extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate2({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  final double minHeight;
  final double maxHeight;
  final Widget child;

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => max(maxHeight, minHeight);

  // double get maxExtent => maxHeight;
  String url = 'https://picsum.photos/200';

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    print(shrinkOffset);
    return Container(
      padding: EdgeInsets.fromLTRB(18.w, headerHeight + 10.w, 18.w, 18.w),
      decoration: const BoxDecoration(image: DecorationImage(image: AssetImage('images/9.jpg'), fit: BoxFit.cover)),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 18.w, 0),
                child: CircleAvatar(
                  maxRadius: 35.w,
                  backgroundImage: NetworkImage(url),
                )),
            Expanded(
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                padding: EdgeInsets.only(bottom: 8.w, top: 8.w),
                child: Text(
                  "骗哥们可以",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: TextStyle(
                    fontSize: 16.sp,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 8.w),
                child: Text(
                  "账号:2131346",
                  style: TextStyle(fontSize: 10.sp, color: Colors.grey),
                ),
              ),
            ]))
          ],
        ),
        Padding(
          padding: EdgeInsets.only(top: 12.w),
          child: Text(
            "骗哥们可以",
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: TextStyle(
              fontSize: 14.sp,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 12.w),
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(5.w, 1.w, 5.w, 1.w),
                decoration: BoxDecoration(color: Colors.grey, borderRadius: BorderRadius.all(Radius.circular(3.w))),
                child: Text("女", style: TextStyle(color: Colors.white, fontSize: 8.sp)),
              )
            ],
          ),
        )
      ]),
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate2 old) {
    return maxHeight != old.maxHeight || minHeight != old.minHeight || child != old.child;
  }
}
