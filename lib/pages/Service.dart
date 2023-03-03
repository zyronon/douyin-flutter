import 'package:flutter/material.dart';
import 'package:hope/pages/components/BasePage.dart';
import 'package:hope/pages/components/BaseCard.dart';

import 'package:hope/pages/components/Gang.dart';
import 'package:hope/pages/components/BaseCard.dart';
import 'package:hope/pages/components/BaseIcon.dart';
import '../utils/ConstVal.dart';
import 'components/BaseHeader.dart';

export '';

class Service extends StatefulWidget {
  const Service({super.key});

  @override
  State<StatefulWidget> createState() => _Service();
}

class _Service extends State<Service> {
  @override
  Widget build(BuildContext context) {
    return BasePage(
        child: Column(children: [
      BaseHeader(title: "分类"),
      Container(
        padding: pagePadding,
        child: Column(
          children: [
            MyCard(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: const [
                    Gang(),
                    Text(
                      "邀请",
                    )
                  ],
                ),
                Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Flex(direction: Axis.horizontal, children: [
                      MyIcon(
                        title: 'data1',
                        img: "images/gray-close-full.png",
                        cb: () => {print('1')},
                      ),
                      MyIcon(
                        title: 'data1',
                        img: "images/gray-close-full.png",
                        cb: () => {print('2')},
                      ),
                      MyIcon(
                        title: 'data1',
                        img: "images/gray-close-full.png",
                        cb: () => {print('2')},
                      )
                    ])),
                Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Flex(direction: Axis.horizontal, children: [
                      MyIcon(
                        title: 'data1',
                        img: "images/gray-close-full.png",
                        cb: () => {print('1')},
                      ),
                      MyIcon(
                        title: 'data1',
                        img: "images/gray-close-full.png",
                        cb: () => {print('2')},
                      ),
                      MyIcon(
                        title: 'data1',
                        img: "images/gray-close-full.png",
                        cb: () => {print('2')},
                      )
                    ])),
              ],
            ))
          ],
        ),
      )
    ]));
  }
}
