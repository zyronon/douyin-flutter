import 'dart:io';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hope/pages/components/BaseHeader.dart';
import 'package:hope/pages/components/BasePage.dart';
import 'package:hope/pages/components/BaseScrollView.dart';
import 'package:hope/utils/ConstVal.dart';

// 应用类
class Page4 extends StatefulWidget {
  const Page4({Key? key}) : super(key: key);

  @override
  _Page4 createState() => _Page4();
}

// 应用状态类
class _Page4 extends State<Page4> {
  @override
  void initState() {
    print('page4-initState');
    super.initState();
  }

  Widget card() {
    Color border = const Color(0xffe1e1e1);
    return InkWell(
      onTap: () => {Navigator.pushNamed(context, 'OrderDetail')},
      child: Container(
          margin: EdgeInsets.only(bottom: 8.w),
          padding: EdgeInsets.only(top: 8.w, bottom: 8.w),
          decoration: BoxDecoration(color: Colors.white),
          child: Column(children: [
            Padding(
                padding: EdgeInsets.only(left: 8.w, right: 8.w),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(3.w),
                            child: Image.asset(
                              "images/9.jpg",
                              width: 25.w,
                              height: 25.w,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(padding: EdgeInsets.only(left: 8.w, right: 4.w), child: Text("data")),
                          const Icon(
                            Icons.chevron_right,
                          ),
                        ]),
                        Text(
                          "交易已取消",
                          style: TextStyle(color: Colors.red),
                        )
                      ],
                    ),
                    Padding(
                        padding: EdgeInsets.only(top: 8.w),
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
                                    height: 80.w,
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
                                        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text("中式推拿"),
                                              Text("x 1"),
                                            ],
                                          ),
                                          Text(
                                            "服务时间:2023-02-02 19:23:00",
                                            style: TextStyle(color: Colors.grey, fontSize: 12.sp),
                                          ),
                                        ]),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: [
                                            Text(
                                              "实付：236",
                                              style: TextStyle(color: Colors.black, fontSize: 14.sp),
                                            ),
                                          ],
                                        )
                                      ],
                                    )),
                              )
                            ],
                          ),
                        )),
                  ],
                )),
            Container(
              margin: EdgeInsets.only(top: 8.w),
              padding: EdgeInsets.only(top: 8.w),
              decoration: BoxDecoration(border: Border(top: BorderSide(color: line))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    decoration: BoxDecoration(border: Border.all(color: border), borderRadius: BorderRadius.all(Radius.circular(4.w))),
                    padding: EdgeInsets.fromLTRB(6.w, 5.w, 6.w, 5.w),
                    margin: EdgeInsets.only(right: 8.w),
                    child: Text("申请售后"),
                  ),
                  Container(
                    decoration: BoxDecoration(border: Border.all(color: border), borderRadius: BorderRadius.all(Radius.circular(4.w))),
                    padding: EdgeInsets.fromLTRB(6.w, 5.w, 6.w, 5.w),
                    margin: EdgeInsets.only(right: 8.w),
                    child: Text("删除订单"),
                  )
                ],
              ),
            ),
          ])),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const BaseHeader(title: '消费', showBack: false),
        Column(children: [
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, 'MyOrders');
            },
            child: Text('订单'),
          ),
        ])
      ],
    );
  }
}
