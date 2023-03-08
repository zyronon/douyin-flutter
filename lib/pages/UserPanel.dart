import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:hope/pages/Home/Page3.dart';
import 'package:hope/pages/components/BaseHeader.dart';
import 'package:hope/pages/components/BasePage.dart';
import 'package:hope/pages/components/MySliverAppBar.dart';
import 'package:hope/pages/components/PreviewCard.dart';
import 'package:hope/utils/ConstVal.dart';

class UserPanel extends StatefulWidget {
  const UserPanel({super.key});

  @override
  State<StatefulWidget> createState() => _UserPanelState();
}

class _UserPanelState extends State<UserPanel> {
  String url = 'https://picsum.photos/200';
  final rnd = Random();
  late List<int> extents = [];

  @override
  void initState() {
    super.initState();
    // 初始化数据
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return BasePage(
        child: Stack(
      children: [
        CustomScrollView(
          slivers: <Widget>[
            _buildBanner(),
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
          minHeight: 40.w, //收起的高度
          maxHeight: 40.w, //展开的最大高度
          child: Container(
            // color: Colors.grey,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.only(topLeft: Radius.circular(10.w), topRight: Radius.circular(10.w))),
              alignment: Alignment.center,
              child: Text("作品", style: TextStyle(fontSize: 14.sp, color: Colors.black)),
            ),
          )),
    );
  }

  Widget _buildList() {
    return SliverPadding(
      padding: EdgeInsets.all(6.w),
      sliver: SliverGrid.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, //Grid按两列显示
          mainAxisSpacing: 6.w,
          crossAxisSpacing: 6.w,
          childAspectRatio: .6,
        ),
        itemCount: extents.length,
        itemBuilder: (context, index) {
          if (index == extents.length - 1) {
            getData();
          }
          return PreviewCard(index: index, width: 200, height: 200);
        },
      ),
    );
  }

  Widget _buildList2() {
    return SliverToBoxAdapter(
      child: MasonryGridView.count(
        padding: EdgeInsets.only(left: 4.w, right: 4.w),
        crossAxisCount: 2,
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
    );
  }

  //模拟异步获取数据
  void getData() {
    Future.delayed(Duration(milliseconds: 200)).then((e) {
      setState(() {
        extents.addAll(List<int>.generate(10, (int index) => rnd.nextInt(2) + 1));
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
