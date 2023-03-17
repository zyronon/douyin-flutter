import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'dart:ui';

import 'package:bruno/bruno.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hope/model/woman.dart';
import 'package:hope/pages/components/BasePage.dart';
import 'package:hope/utils/SliverHeaderDelegate.dart';
import '../../utils/ConstVal.dart';
import 'components/BaseCard.dart';
import 'components/BaseScrollView.dart';

export '';

class UserList extends StatefulWidget {
  const UserList({super.key});

  @override
  State<StatefulWidget> createState() => _UserList();
}

class _UserList extends State<UserList> {
  List<Woman> list = [];
  List<BrnSelectionEntity>? items;
  List<BrnSelectionEntity> filterData = [];

  getData() async {
    // Dio dio = Dio();
    // var res = await dio.get("http://172.16.1.17:3000/userList");
    // res.data = jsonDecode(res.data);
    // if (res.data['code'] == 200) {
    //   setState(() {
    //     list = res.data['data'].map<Woman>((i) => Woman.fromJson(i)).toList();
    //   });
    // }
    rootBundle.loadString('assets/multi_list_filter.json').then((data) {
      setState(() {
        filterData = BrnSelectionEntityListBean.fromJson(const JsonDecoder().convert(data)["data"])!.list!;
      });
    });
    rootBundle.loadString('assets/userList.json').then((data) {
      Map<String, dynamic> map = jsonDecode(data);
      setState(() {
        list = map['data'].map<Woman>((i) => Woman.fromJson(i)).toList();
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  Widget floatHeader() {
    return SliverPersistentHeader(
      pinned: false,
      floating: true,
      delegate: SliverHeaderDelegate.fixedHeight(
        height: 50.w,
        child: Container(
          color: Colors.white,
          height: headerHeight + 10.w,
          padding: EdgeInsets.only(left: 8.w),
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
                      color: Colors.black,
                      size: 18.w,
                    ),
                  ),
                ),
              ),
              Expanded(
                  child: BrnSearchText(
                      maxHeight: 50.w,
                      innerPadding: EdgeInsets.only(left: 0.w, right: 10.w, top: 6.w, bottom: 6.w),
                      innerColor: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(20.w)),
                      normalBorder: Border.all(color: const Color(0xFFF0F0F0), width: 1, style: BorderStyle.solid),
                      // activeBorder: Border.all(color: Color(0xFF0984F9), width: 1, style: BorderStyle.solid),
                      autoFocus: false)),
            ],
          ),
        ),
      ),
    );
  }

  Widget fixedSort() {
    return SliverPersistentHeader(
      pinned: true,
      delegate: SliverHeaderDelegate.fixedHeight(
          //固定高度
          height: 40.w,
          child: BrnSelectionView(
              originalSelectionData: filterData,
              onSelectionChanged: (int menuIndex, Map<String, String> filterParams, Map<String, String> customParams,
                  BrnSetCustomSelectionMenuTitle setCustomTitleFunction) {
                BrnToast.show(filterParams.toString(), context);
              })),
    );
  }

  Widget userCard(Woman item) {
    return InkWell(
        onTap: () => {Navigator.pushNamed(context, 'UserPanel')},
        child: Container(
            margin: EdgeInsets.only(bottom: 8.w),
            padding: EdgeInsets.all(8.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.w),
              color: Colors.white,
            ),
            child: Column(
              children: [
                Flex(
                  direction: Axis.horizontal,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                        flex: 1,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                const Text("袖娘："),
                                Text(item.name),
                              ],
                            ),
                            Row(
                              children: [
                                Text("年纪："),
                                Text(item.age.toString()),
                                Padding(padding: EdgeInsets.only(left: 20), child: Text("体重：")),
                                Text(item.weight.toString()),
                              ],
                            ),
                            Row(
                              children: [
                                Text("身高："),
                                Text(item.height.toString()),
                              ],
                            ),
                            Row(
                              children: [
                                Text("性格："),
                                Text(item.height.toString()),
                              ],
                            ),
                            Row(
                              children: [
                                Text("国籍："),
                                Text(item.height.toString()),
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(child: Text("成都双流成都双流成都双流成都双流", style: TextStyle(color: Color(mainColor), fontSize: 12)))
                              ],
                            )
                          ],
                        )),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        "images/9.jpg",
                        width: 150.0,
                        height: 150.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text.rich(TextSpan(children: [
                        TextSpan(text: "服务价格范围:", style: TextStyle(color: Colors.grey, fontSize: 12)),
                        TextSpan(
                            text: item.lowPrice.toString() + '~' + item.highPrice.toString(),
                            style: TextStyle(color: Colors.blue, fontSize: 22))
                      ])),
                      InkWell(
                        onTap: () => {Navigator.pushNamed(context, 'PlaceOrder')},
                        child: Container(
                          width: 120,
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Color(mainColor),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Text(
                            "立即预约",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            )));
  }

  Widget userList() {
    return SliverPadding(
      padding: EdgeInsets.all(12.w),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          (BuildContext context, int index) {
            return userCard(list[index]);
          },
          childCount: list.length,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BasePage(
        child: CustomScrollView(
      slivers: [
        floatHeader(),
        if (filterData.isNotEmpty) fixedSort(),
        userList(),
      ],
    ));
  }
}
