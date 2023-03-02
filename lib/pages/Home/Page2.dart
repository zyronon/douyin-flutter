import 'dart:async';
import 'dart:convert';
import 'dart:ui';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hope/model/woman.dart';
import '../../utils/ConstVal.dart';

export '';

class Page2 extends StatefulWidget {
  const Page2({super.key});

  @override
  State<StatefulWidget> createState() => _Page2();
}

class _Page2 extends State<Page2> {
  List<Woman> list = [];

  Widget card2 = Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), border: Border.all(color: Color(mainColor))),
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
                        children: const [
                          Text("袖娘："),
                          Text("data"),
                        ],
                      ),
                      Row(
                        children: const [
                          Text("年纪："),
                          Text("data"),
                          Padding(padding: EdgeInsets.only(left: 20), child: Text("体重：")),
                          Text("data"),
                        ],
                      ),
                      Row(
                        children: const [
                          Text("身高："),
                          Text("data"),
                        ],
                      ),
                      Row(
                        children: const [
                          Text("性格："),
                          Text("data"),
                        ],
                      ),
                      Row(
                        children: const [
                          Text("国籍："),
                          Text("data"),
                        ],
                      ),
                      Row(
                        children: [Expanded(child: Text("成都双流成都双流成都双流成都双流", style: TextStyle(color: Color(mainColor), fontSize: 12)))],
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
                const Text.rich(TextSpan(children: [
                  TextSpan(text: "服务价格范围:", style: TextStyle(color: Colors.grey, fontSize: 12)),
                  TextSpan(text: "280 ~ 360", style: TextStyle(color: Colors.blue, fontSize: 22))
                ])),
                Container(
                  width: 100,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(12.0),
                  decoration: BoxDecoration(
                    color: Color(mainColor),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Text(
                    "立即登录",
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ],
            ),
          )
        ],
      ));

  card(Woman item) {
    return Container(
        margin: const EdgeInsets.only(bottom: 18),
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), border: Border.all(color: Color(mainColor))),
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
                          children: [Expanded(child: Text("成都双流成都双流成都双流成都双流", style: TextStyle(color: Color(mainColor), fontSize: 12)))],
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
                  Container(
                    width: 100,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(12.0),
                    decoration: BoxDecoration(
                      color: Color(mainColor),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Text(
                      "立即预约",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                ],
              ),
            )
          ],
        ));
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
    return DefaultTextStyle(
        style: const TextStyle(color: Colors.white),
        child: Container(
          margin: const EdgeInsets.only(left: 10, right: 10),
          decoration: BoxDecoration(border: Border.all(color: Colors.green)),
          child: ListView.builder(
              padding: const EdgeInsets.all(0),
              itemCount: list.length,
              itemBuilder: (BuildContext context, int index) {
                return card(list[index]);
              }),
        ));
  }
}
