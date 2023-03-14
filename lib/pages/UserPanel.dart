import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:hope/pages/components/BaseCard.dart';
import 'package:hope/pages/components/BasePage.dart';
import 'package:hope/pages/components/PreviewCard.dart';
import 'package:hope/utils/ConstVal.dart';

import 'components/BaseScrollView.dart';

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
    getData();
  }

  @override
  Widget build(BuildContext context) {
    Color border = const Color(0xffe1e1e1);
    return BasePage(
        child: DefaultTabController(
      length: 2, // tab的数量.
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverOverlapAbsorber(
                handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                sliver: SliverPersistentHeader(
                  pinned: true,
                  delegate: _SliverAppBarDelegate2(
                    minHeight: headerHeight * 2,
                    maxHeight: 350.w,
                  ),
                ),
              ),
            ];
          },
          body: BaseScrollView(
              child: TabBarView(children: [
            Builder(
              builder: (BuildContext context) {
                return Container(
                  padding: pagePadding,
                  color: mainBgColor2,
                  child: CustomScrollView(
                    key: const PageStorageKey<String>('one'),
                    slivers: <Widget>[
                      SliverOverlapInjector(
                        handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                      ),
                      SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (BuildContext context, int index) {
                            return InkWell(
                              onTap: () => {Navigator.pushNamed(context, 'OrderDetail')},
                              child: BaseCard(
                                  child: IntrinsicHeight(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(right: 8.w),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(8.w),
                                        child: Image.asset(
                                          "images/9.jpg",
                                          width: 100.w,
                                          height: 100.w,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: SizedBox(
                                          height: double.infinity,
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Column(
                                                children: [
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [Expanded(child: Text("中式推拿", style: titleStyle))],
                                                  ),
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [Expanded(child: Text("中式推拿", style: descStyle))],
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Text.rich(TextSpan(children: [
                                                    TextSpan(text: "￥", style: TextStyle(color: Colors.red,fontSize: 12.sp)),
                                                    TextSpan(text: "2336", style: TextStyle(color: Colors.red,fontSize: 20.sp)),
                                                  ])),
                                                  Container(
                                                    decoration: BoxDecoration(
                                                        border: Border.all(color: border),
                                                        borderRadius: BorderRadius.all(Radius.circular(4.w))),
                                                    padding: EdgeInsets.fromLTRB(6.w, 5.w, 6.w, 5.w),
                                                    child: Text("立即预约"),
                                                  ),
                                                ],
                                              )
                                            ],
                                          )),
                                    )
                                  ],
                                ),
                              )),
                            );
                          },
                          childCount: 1,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            Builder(
              builder: (BuildContext context) {
                return Container(
                  padding: EdgeInsets.all(4.w),
                  color: mainBgColor2,
                  child:  CustomScrollView(
                    key: const PageStorageKey<String>('two'),
                    slivers: <Widget>[
                      SliverOverlapInjector(
                        handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                      ),
                      SliverMasonryGrid.count(
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
                      ),
                    ],
                  ),
                );
              },
            )
          ])),
        ),
      ),
    ));
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

class _SliverAppBarDelegate2 extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate2({
    required this.minHeight,
    required this.maxHeight,
  });

  final double minHeight;
  final double maxHeight;

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => max(maxHeight, minHeight);

  String url = 'https://picsum.photos/200';

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    final double opacity = shrinkOffset > (headerHeight * 3) ? 1 : shrinkOffset / (headerHeight * 3);
    final bool isFixed = (maxHeight - shrinkOffset) < headerHeight * 2;

    return SizedBox(
        width: 1.sw,
        height: maxHeight,
        child: Stack(
          children: [
            Positioned(
              top: isFixed ? -(maxHeight - headerHeight * 2) : -shrinkOffset,
              // top: 0,
              left: 0.0,
              right: 0.0,
              height: maxHeight,
              child: Container(
                  // padding: EdgeInsets.fromLTRB(0, headerHeight + 10.w, 0, 18.w),
                  decoration: const BoxDecoration(image: DecorationImage(image: AssetImage('images/9.jpg'), fit: BoxFit.cover)),
                  child: Stack(
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(18.w, headerHeight + 10.w, 18.w, 18.w),
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
                                    style: TextStyle(fontSize: 16.sp, color: Colors.white),
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
                              style: TextStyle(fontSize: 14.sp, color: Colors.white),
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
                          ),
                        ]),
                      ),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                          height: headerHeight,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(8.w),
                              topRight: Radius.circular(8.w),
                            ),
                          ),
                          child: TabBar(
                            labelColor: Colors.black,
                            padding: EdgeInsets.only(left: .3.sw, right: .3.sw),
                            indicatorPadding: EdgeInsets.only(left: 20.w, right: 20.w),
                            tabs: const [
                              Tab(icon: null, text: "服务"),
                              Tab(icon: null, text: "作品"),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )),
            ),
            Container(
              color: Color.fromRGBO(46, 46, 46, opacity),
              width: 1.sw,
              height: headerHeight,
              child: Row(
                children: [
                  InkWell(
                    onTap: () => {Navigator.pop(context)},
                    child: SizedBox(
                      width: headerHeight,
                      height: headerHeight,
                      child: Center(
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                          size: 18.w,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ));
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate2 old) {
    return maxHeight != old.maxHeight || minHeight != old.minHeight;
  }
}
