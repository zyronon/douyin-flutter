import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hope/model/video.dart';

export '';

/// Stateful widget to fetch and then display video content.
class Page3 extends StatefulWidget {
  const Page3({Key? key}) : super(key: key);

  @override
  _Page3 createState() => _Page3();
}

class _Page3 extends State<Page3> {
  final rnd = Random();
  late List<VideoModel> list = [];
  int crossAxisCount = 2;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() {
    rootBundle.loadString('assets/resource.json').then((data) {
      Map<String, dynamic> map = jsonDecode(data);
      setState(() {
        list = map['videos'].asMap().entries.map<VideoModel>((entry) {
          return VideoModel.fromRawJson(entry.value);
        }).toList();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Text("data112");
  }
}
