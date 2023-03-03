import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/ConstVal.dart';
import 'components/MyHeader.dart';

export '';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<StatefulWidget> createState() => _Search();
}

class _Search extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MyHeader(title: "搜索"),
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
                Row(children: [
                  Text("data")
                ],)
              ],
            )),
      ],
    );
  }
}
