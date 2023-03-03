import 'package:flutter/material.dart';
import 'package:hope/pages/components/BasePage.dart';

import '../utils/ConstVal.dart';
import 'components/BaseHeader.dart';

export '';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<StatefulWidget> createState() => _Search();
}

class _Search extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return BasePage(
        child: Column(
      children: [
        BaseHeader(title: "搜索"),
        Container(
            decoration: BoxDecoration(border: Border.all(color: Colors.white)),
            padding: pagePadding,
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 0),
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(24, 32, 46, 1),
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
                        width: 30.0,
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 18),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "搜索历史",
                        style: TextStyle(fontSize: 28, color: Colors.grey),
                      ),
                      Image.asset(
                        "images/like-red-small.png",
                        width: 30.0,
                      )
                    ],
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.only(top: 18),
                    child: SizedBox(
                      width: double.infinity,
                      child: Wrap(
                        spacing: 8.0, // 主轴(水平)方向间距
                        runSpacing: 8, // 纵轴（垂直）方向间距
                        children: [
                          for (int i = 0; i < 10; i++)
                            Container(
                              padding: const EdgeInsets.fromLTRB(10, 4, 10, 4),
                              decoration: BoxDecoration(color: Colors.grey, borderRadius: BorderRadius.circular(2)),
                              child: const Text(
                                '历史记录',
                                style: TextStyle(fontSize: 14),
                              ),
                            )
                        ],
                      ),
                    )),
              ],
            )),
      ],
    ));
  }
}
