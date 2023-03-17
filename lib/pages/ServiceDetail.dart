import 'package:flutter/material.dart';

class ServiceDetail extends StatefulWidget {
  const ServiceDetail({super.key});

  @override
  State<StatefulWidget> createState() => _ServiceDetailState();
}

class _ServiceDetailState extends State<ServiceDetail> {
  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() {}

  @override
  Widget build(BuildContext context) {
    return Text("ServiceDetail");
    // return const BasePage(child: SlideItem(index: 1,));
  }
}
