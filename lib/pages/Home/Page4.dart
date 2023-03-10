import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
    return Container(
        margin: EdgeInsets.only(top: 8.w, bottom: 8.w),
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
                        Padding(padding: EdgeInsets.only(left: 8.w, right: 8.w), child: Text("data")),
                        Icon(
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
        ]));
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
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
              child: TabBarView(
            children: [
              Icon(Icons.directions_boat),
              Icon(Icons.directions_car),
              Column(children: [card()]),
              Icon(Icons.directions_car),
              Icon(Icons.directions_car),
            ],
          ))
        ],
      ),
    );
  }
}
