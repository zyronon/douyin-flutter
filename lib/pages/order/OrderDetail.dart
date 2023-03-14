import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hope/pages/components/BaseCard2.dart';
import 'package:hope/pages/components/BaseHeader.dart';
import 'package:hope/pages/components/BasePage.dart';
import 'package:bruno/bruno.dart';
import 'package:hope/pages/components/Gang.dart';
import 'package:hope/utils/ConstVal.dart';

import 'components/OrderCard.dart';

export '';

class OrderDetail extends StatefulWidget {
  const OrderDetail({super.key});

  @override
  State<StatefulWidget> createState() => _OrderDetail();
}

class _OrderDetail extends State<OrderDetail> {
  double itemHeight = 30.w;
  Color border = const Color(0xffe1e1e1);
  double itemPadding = 5.w;
  double footerHeight = 50.w;

  @override
  Widget build(BuildContext context) {
    return BasePage(
        child: Column(
      children: [
        const BaseHeader(title: "已取消"),
        Expanded(
            child: Stack(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height - 24 - headerHeight - footerHeight,
              child: SingleChildScrollView(
                  child: Column(children: [
                BaseCard2(
                    child: Column(
                  children: [
                    BrnHorizontalSteps(
                      controller: BrnStepsController(currentIndex: 1),
                      steps: const [
                        BrunoStep(
                          stepContentText: "技师接单",
                        ),
                        BrunoStep(
                          stepContentText: "技师出发",
                        ),
                        BrunoStep(
                          stepContentText: "技师到达",
                        ),
                        BrunoStep(
                          stepContentText: "开始服务",
                        ),
                        BrunoStep(
                          stepContentText: "服务完成",
                        )
                      ],
                    ),
                    Container(
                      decoration: BoxDecoration(border: Border(top: BorderSide(color: line))),
                      padding: EdgeInsets.all(8.w),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.place_outlined,
                          ),
                          Expanded(
                              child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                "王小二 13800138000 成都市双流区华阳天府五街",
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                              Text(
                                "嘉瑞五路",
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                            ],
                          )),
                          Container(
                            padding: EdgeInsets.only(left: 10.w, top: 4.w, right: 10.w, bottom: 4.w),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(4.w)), border: Border.all(color: Colors.redAccent)),
                            child: const Text(
                              "修改",
                              style: TextStyle(color: Colors.red),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                )),
                const OrderCard(clickCanGoDetail: false),
                BaseCard2(
                    needPadding: true,
                    child: DefaultTextStyle(
                      style: TextStyle(fontSize: 12.sp, color: Colors.grey),
                      child: Column(
                        children: [
                          const Gang('费用详情'),
                          Padding(
                            padding: EdgeInsets.only(top: itemPadding, bottom: itemPadding),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text("项目金额"),
                                Text(
                                  "218",
                                  style: TextStyle(color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: itemPadding, bottom: itemPadding),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: 80.w,
                                  child: const Text("出行费用"),
                                ),
                                Expanded(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: const [
                                      Text.rich(TextSpan(children: [
                                        TextSpan(text: "出租", style: TextStyle(color: Colors.green)),
                                        TextSpan(text: "全程11公里", style: TextStyle(color: Colors.black)),
                                      ])),
                                      Text("42.8", style: TextStyle(color: Colors.black)),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: itemPadding, bottom: itemPadding),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 80.w,
                                  child: const Text("备注"),
                                ),
                                const Expanded(
                                    child: Text(
                                  "备注备注备注备注备注备注备注备注备注备注备注备注备注备注备注备注备注备注",
                                  style: TextStyle(color: Colors.black),
                                ))
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: itemPadding, bottom: itemPadding),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 80.w,
                                  child: const Text("支付方式"),
                                ),
                                const Text(
                                  "微信",
                                  style: TextStyle(color: Colors.black),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: itemPadding, bottom: itemPadding),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 80.w,
                                  child: const Text("项目总价", style: TextStyle(color: Colors.black)),
                                ),
                                const Text(
                                  "222",
                                  style: TextStyle(color: Colors.black),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    )),
                BaseCard2(
                    needPadding: true,
                    child: DefaultTextStyle(
                      style: TextStyle(fontSize: 12.sp, color: Colors.grey),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Gang('订单信息'),
                          Padding(
                            padding: EdgeInsets.only(top: itemPadding, bottom: itemPadding),
                            child: const Text("订单编号：222222222222222222222"),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: itemPadding, bottom: itemPadding),
                            child: const Text("下单时间：2023-08-08 09:09:09"),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: itemPadding, bottom: itemPadding),
                            child: const Text("完成时间：2023-08-08 09:09:09"),
                          ),
                        ],
                      ),
                    )),
                BaseCard2(
                    needPadding: true,
                    child: DefaultTextStyle(
                      style: TextStyle(fontSize: 12.sp, color: Colors.grey),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Gang('订单信息'),
                          Padding(
                            padding: EdgeInsets.only(top: itemPadding, bottom: itemPadding),
                            child: const Text("订单编号：222222222222222222222"),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: itemPadding, bottom: itemPadding),
                            child: const Text("下单时间：2023-08-08 09:09:09"),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: itemPadding, bottom: itemPadding),
                            child: const Text("完成时间：2023-08-08 09:09:09"),
                          ),
                        ],
                      ),
                    )),
              ])),
            ),
            Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: footerHeight,
                  decoration: BoxDecoration(color: Colors.white, border: Border(top: BorderSide(color: line))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.all(Radius.circular(4.w))),
                        padding: EdgeInsets.fromLTRB(6.w, 5.w, 6.w, 5.w),
                        margin: EdgeInsets.only(right: 8.w),
                        child: Text(
                          "再来一单",
                          style: TextStyle(color: Colors.white),
                        ),
                      )
                    ],
                  ),
                ))
          ],
        ))
      ],
    ));
  }
}
