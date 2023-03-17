import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hope/pages/components/Gang.dart';
import 'package:hope/pages/components/BaseCard.dart';
import 'package:hope/pages/components/BaseIcon.dart';
import 'package:hope/utils/ConstVal.dart';

export '';

class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<StatefulWidget> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  Widget goService(Widget child) {
    return InkWell(
      onTap: () => {Navigator.pushNamed(context, 'UserList')},
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
            padding: const EdgeInsets.all(18.0),
            decoration: const BoxDecoration(),
            child: Column(
              children: [
                BaseCard(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "你好 客官",
                        style: TextStyle(color: Colors.black, fontSize: 22.sp),
                      ),
                      Text(
                        "您今天要找什么？",
                        style: TextStyle(color: Colors.black, fontSize: 28.sp),
                      ),
                      InkWell(
                        // onTap: () => {Navigator.pushNamed(context, 'Search')},
                        onTap: () => {Navigator.pushNamed(context, 'Test')},
                        child: Container(
                          margin: const EdgeInsets.only(top: 10.0),
                          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            // color: const Color.fromRGBO(24, 32, 46, 1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                  child: Padding(
                                padding: EdgeInsets.fromLTRB(0, 12.w, 0, 12.w),
                                child: Text("搜索您需要的服务"),
                              )),
                              Image.asset(
                                "images/like-red-small.png",
                                width: 30.0,
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                BaseCard(
                  child: Flex(
                    direction: Axis.horizontal,
                    children: [
                      BaseIcon(
                        title: 'data1',
                        img: "images/gray-close-full.png",
                        cb: () => {Navigator.pushNamed(context, 'UserList')},
                      ),
                      BaseIcon(
                        title: 'data1',
                        img: "images/gray-close-full.png",
                        cb: () => {Navigator.pushNamed(context, 'UserList')},
                      ),
                      BaseIcon(
                        title: 'data1',
                        img: "images/gray-close-full.png",
                        cb: () => {Navigator.pushNamed(context, 'UserList')},
                      ),
                      BaseIcon(
                        title: 'data1',
                        img: "images/gray-close-full.png",
                        cb: () => {Navigator.pushNamed(context, 'UserList')},
                      ),
                    ],
                  ),
                ),
                BaseCard(
                  child: Flex(
                    direction: Axis.vertical,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Gang('上门服务'),
                          InkWell(
                            onTap: () => {Navigator.pushNamed(context, 'Service')},
                            child: Container(
                              padding: EdgeInsets.fromLTRB(10.w, 2.w, 4.w, 2.w),
                              decoration: BoxDecoration(
                                  color: const Color.fromRGBO(220, 220, 220, 1.0),
                                  borderRadius: BorderRadius.circular(18),
                                  border: Border.all(color: Colors.green)),
                              child: Row(
                                children: [
                                  Text("更多服务", style: descStyle),
                                  Icon(
                                    Icons.chevron_right_rounded,
                                    size: 20.w,
                                    color: Colors.grey,
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            for (int i = 0; i < (3); i++)
                              InkWell(
                                onTap: () => {Navigator.pushNamed(context, 'UserList')},
                                child: Padding(
                                  padding: EdgeInsets.only(right: 10.w, top: 10.w),
                                  child: Column(
                                    children: [
                                      Stack(
                                        children: [
                                          ClipRRect(
                                            borderRadius: BorderRadius.circular(12.w),
                                            child: Image.asset(
                                              "images/9.jpg",
                                              width: 150.0,
                                              height: 150.0,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          Container(
                                            margin: const EdgeInsets.only(top: 10.0, left: 10),
                                            padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
                                            decoration: BoxDecoration(
                                              color: const Color.fromRGBO(222, 82, 82, 1.0),
                                              borderRadius: BorderRadius.circular(18),
                                            ),
                                            child: Text(
                                              "10%折扣",
                                              style: TextStyle(color: Colors.white, fontSize: 12.sp),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.only(top: 10),
                                        child: Text("SPA"),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                BaseCard(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(padding: EdgeInsets.only(top: 6.w, bottom: 6.w), child: const Gang("邀请")),
                    Row(children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.error_rounded,
                                size: 18.w,
                              ),
                              Container(
                                margin: const EdgeInsets.only(left: 10),
                                width: 200, //添加这一行
                                child: const Text(
                                  "邀请新用户可永久获得该好友后续消费费用的2%免费消费额度",
                                ),
                              ),
                            ],
                          ),
                          Text(
                            "已收益1300元",
                            style: TextStyle(fontSize: 22.sp),
                          ),
                          Container(
                              margin: const EdgeInsets.only(left: 10),
                              child: InkWell(
                                onTap: () => {print('邀请')},
                                child: Row(
                                  children: [
                                    const Text(
                                      "立即邀请",
                                      style: TextStyle(fontSize: 20),
                                    ),
                                    Icon(
                                      Icons.chevron_right_rounded,
                                    ),
                                  ],
                                ),
                              )),
                        ],
                      ),
                      Image.asset(
                        'images/9.jpg',
                        width: 100.w,
                      ),
                    ])
                  ],
                ))
              ],
            )));
  }
}
