import 'package:flutter/material.dart';
import 'package:hope/pages/SlideItem.dart';
import 'package:hope/pages/components/BasePage.dart';

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  State<StatefulWidget> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Text("data");

    // return const BasePage(child: SlideItem(index: 1,));
  }
}
