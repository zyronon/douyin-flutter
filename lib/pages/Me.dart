import 'package:flutter/material.dart';
import 'package:hope/pages/components/BaseCard.dart';
import 'package:hope/pages/components/BasePage.dart';
import 'package:hope/pages/components/Gang.dart';

import '../utils/ConstVal.dart';
import 'components/BaseHeader.dart';

export '';

class Me extends StatefulWidget {
  const Me({super.key});

  @override
  State<StatefulWidget> createState() => _Service();
}

class _Service extends State<Me> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const BaseHeader(title: "我", showBack: false),
      Container(
        padding: pagePadding,
        child: Column(
          children: [
            MyCard(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, 'Login');
                  },
                  child: Text('登录'),
                )
              ],
            ))
          ],
        ),
      )
    ]);
  }
}
