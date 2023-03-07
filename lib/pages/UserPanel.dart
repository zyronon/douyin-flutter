import 'package:flutter/material.dart';
import 'package:hope/model/video.dart';
import 'package:hope/pages/components/BaseHeader.dart';
import 'package:hope/pages/components/BasePage.dart';

export '';

class UserPanel extends StatefulWidget {
  const UserPanel({Key? key, this.video}) : super(key: key);

  final Video? video;

  @override
  _UserPanelState createState() => _UserPanelState();
}

class _UserPanelState extends State<UserPanel> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BasePage(
      child: Column(
        children: [
          Stack(
            children: [
              const BaseHeader(),
              Image.network('https://picsum.photos/200',),
              Column(children: [

              ],)
            ],
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
