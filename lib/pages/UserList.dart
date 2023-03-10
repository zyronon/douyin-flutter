import 'dart:async';
import 'dart:convert';
import 'dart:ui';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hope/model/woman.dart';
import 'package:hope/pages/components/BasePage.dart';
import '../../utils/ConstVal.dart';

export '';

class UserList extends StatefulWidget {
  const UserList({super.key});

  @override
  State<StatefulWidget> createState() => _UserList();
}

class _UserList extends State<UserList> {
  List<Woman> list = [];

  card(Woman item) {
    return InkWell(
        onTap: () => {Navigator.pushNamed(context, 'UserPanel')},
        child: Container(
            margin: EdgeInsets.only(bottom: 18.w),
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

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    Dio dio = Dio();
    var res = await dio.get("http://172.16.1.17:3000/");
    res.data = jsonDecode(res.data);
    if (res.data['code'] == 200) {
      setState(() {
        list = res.data['data'].map<Woman>((i) => Woman.fromJson(i)).toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BasePage(
        child: Column(children: [
      Container(
        padding: EdgeInsets.all(8.w),
        child: Container(
          height: 36.w,
          padding: EdgeInsets.fromLTRB(8.w, 0, 8.w, 0),
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              Expanded(
                child: TextFormField(
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    hintText: '搜索您需要的服务',
                    hintStyle: TextStyle(color: Color.fromRGBO(64, 69, 82, 1)),
                    border: InputBorder.none,
                  ),
                ),
              ),
              Image.asset(
                "images/like-red-small.png",
                width: 25.w,
              )
            ],
          ),
        ),
      ),
      SizedBox(
        //Material设计规范中状态栏、导航栏、ListTile高度分别为24、56、56
        height: MediaQuery.of(context).size.height - 24 - 56 - 136.w,
        child: Container(
          padding: EdgeInsets.all(8.w),
          // decoration: BoxDecoration(border: Border.all(color: Colors.green)),
          child: ListView.builder(
              padding: const EdgeInsets.all(0),
              itemCount: list.length,
              itemBuilder: (BuildContext context, int index) {
                return card(list[index]);
              }),
        ),
      ),
    ]));
  }
}
