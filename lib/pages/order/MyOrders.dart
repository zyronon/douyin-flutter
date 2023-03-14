import 'dart:io';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hope/pages/components/BaseHeader.dart';
import 'package:hope/pages/components/BasePage.dart';
import 'package:hope/pages/components/BaseScrollView.dart';
import 'package:hope/utils/ConstVal.dart';

import 'components/OrderCard.dart';

// 应用类
class MyOrders extends StatefulWidget {
  const MyOrders({Key? key}) : super(key: key);

  @override
  _MyOrders createState() => _MyOrders();
}

// 应用状态类
class _MyOrders extends State<MyOrders> {
  @override
  void initState() {
    print('page4-initState');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BasePage(
        child: Column(
      children: [
        BaseHeader(
          title: '我的订单',
          rightWidget: InkWell(
            onTap: () => {Navigator.pushNamed(context, 'OrderSearch')},
            child: SizedBox(
              height: double.infinity,
              width: 40.w,
              child: Center(
                child: Icon(
                  Icons.search,
                  size: 22.w,
                ),
              ),
            ),
          ),
        ),
        if (true)
          Expanded(
              child: DefaultTabController(
            length: 5,
            child: Column(
              children: [
                Material(
                    //这里设置tab的背景色
                    color: Colors.white,
                    child: TabBar(
                      unselectedLabelColor: Colors.grey,
                      labelColor: Colors.black,
                      padding: EdgeInsets.only(left: 10.w, right: 10.w),
                      indicatorPadding: EdgeInsets.only(left: 15.w, right: 15.w),
                      tabs: const [
                        Tab(icon: null, text: "全部"),
                        Tab(icon: null, text: "待付款"),
                        Tab(icon: null, text: "进行中"),
                        Tab(icon: null, text: "已完成"),
                        Tab(icon: null, text: "评价"),
                      ],
                    )),
                Expanded(
                    child: BaseScrollView(
                  child: TabBarView(
                    children: [
                      BaseScrollView(
                        child: ListView.builder(
                            padding: EdgeInsets.only(bottom: 8.w),
                            itemCount: 11,
                            itemBuilder: (BuildContext context, int index) {
                              return OrderCard();
                            }),
                      ),
                      Column(children: [
                        OrderCard(),
                      ]),
                      Icon(Icons.directions_car),
                      Icon(Icons.directions_boat),
                      Icon(Icons.directions_car),
                    ],
                  ),
                ))
              ],
            ),
          ))
      ],
    ));
  }
}
