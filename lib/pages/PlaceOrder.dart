import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hope/pages/components/BaseCard.dart';
import 'package:hope/pages/components/BaseHeader.dart';
import 'package:hope/pages/components/BasePage.dart';
import 'package:hope/utils/ConstVal.dart';

export '';

class PlaceOrder extends StatefulWidget {
  const PlaceOrder({super.key});

  @override
  State<StatefulWidget> createState() => _PlaceOrderState();
}

class _PlaceOrderState extends State<PlaceOrder> {
  @override
  Widget build(BuildContext context) {
    return BasePage(
        child: Column(
      children: [
        const BaseHeader(title: '订单'),
        Padding(
            padding: pagePadding,
            child: DefaultTextStyle(
              style: TextStyle(fontSize: 12.sp, color: Colors.grey),
              child: BaseCard(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 8.w, bottom: 8.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("服务技师"),
                          Text("其他"),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 8.w, bottom: 8.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("服务技师"),
                          Text("其他"),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ))
      ],
    ));
  }
}
