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
  String radio1 = "";
  String radio2 = "";
  int count = 1;
  double itemHeight = 30.w;

  @override
  Widget build(BuildContext context) {
    return BasePage(
        child: Stack(
      children: [
        Column(
          children: [
            const BaseHeader(title: '订单'),
            Padding(
                padding: pagePadding,
                child: BaseCard(
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
                      decoration:
                          BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(4.w)), border: Border.all(color: Colors.redAccent)),
                      child: const Text(
                        "修改",
                        style: TextStyle(color: Colors.red),
                      ),
                    )
                  ],
                ))),
            Padding(
                padding: pagePadding,
                child: DefaultTextStyle(
                  style: TextStyle(fontSize: 12.sp, color: Colors.grey),
                  child: BaseCard(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(right: 8.w),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(12.w),
                                    child: Image.asset(
                                      "images/9.jpg",
                                      width: 80.w,
                                      height: 60.w,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("中式推拿", style: TextStyle(fontSize: 16.sp)),
                                    Text("￥218", style: TextStyle(fontSize: 16.sp, color: Colors.red, fontWeight: FontWeight.bold)),
                                  ],
                                )
                              ],
                            ),
                            Row(
                              children: [
                                InkWell(
                                    onTap: () => setState(() => {if (count > 1) count--}),
                                    child: const Icon(
                                      Icons.remove_circle_outline_sharp,
                                      color: Colors.green,
                                    )),
                                Padding(
                                    padding: EdgeInsets.only(left: 10.w, right: 10.w),
                                    child: Text(
                                      count.toString(),
                                      style: TextStyle(fontSize: 16.sp),
                                    )),
                                InkWell(
                                    onTap: () => setState(() => {count++}),
                                    child: const Icon(
                                      Icons.add_circle_outline_sharp,
                                      color: Colors.green,
                                    )),
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          height: itemHeight,
                          child: Padding(
                            padding: EdgeInsets.only(top: 0.w, bottom: 0.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text("服务技师"),
                                Text("其他"),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: itemHeight,
                          child: Padding(
                            padding: EdgeInsets.only(top: 0.w, bottom: 0.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("服务时间"),
                                Row(
                                  children: const [
                                    Text("(今天)11:30", style: TextStyle(color: Colors.green)),
                                    Icon(
                                      Icons.chevron_right,
                                      color: Colors.green,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: itemHeight,
                          child: Padding(
                            padding: EdgeInsets.only(top: 0.w, bottom: 0.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text("车费"),
                                Text(
                                  "￥46",
                                  style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: itemHeight,
                          child: Padding(
                            padding: EdgeInsets.only(top: 0.w, bottom: 0.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("备注"),
                                Row(
                                  children: const [
                                    Text("选填"),
                                    Icon(
                                      Icons.chevron_right,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )),
            Padding(
                padding: pagePadding,
                child: DefaultTextStyle(
                  style: TextStyle(fontSize: 12.sp, color: Colors.grey),
                  child: BaseCard(
                    child: Column(
                      children: [
                        SizedBox(
                          height: itemHeight,
                          child: Padding(
                            padding: EdgeInsets.only(top: 0.w, bottom: 0.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(right: 6.w),
                                      child: Icon(
                                        Icons.paid,
                                        size: 18.w,
                                      ),
                                    ),
                                    Text("账号余额")
                                  ],
                                ),
                                Radio(
                                  value: "lafayette",
                                  groupValue: radio1,
                                  onChanged: (String? value) {
                                    setState(() {
                                      radio1 = value!;
                                    });
                                  },
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: itemHeight,
                          child: Padding(
                            padding: EdgeInsets.only(top: 0.w, bottom: 0.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(right: 6.w),
                                      child: Icon(
                                        Icons.paid,
                                        size: 18.w,
                                      ),
                                    ),
                                    Text("微信支付")
                                  ],
                                ),
                                Radio(
                                  value: "lafayette",
                                  groupValue: radio1,
                                  onChanged: (String? value) {
                                    setState(() {
                                      radio1 = value!;
                                    });
                                  },
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: itemHeight,
                          child: Padding(
                            padding: EdgeInsets.only(top: 0.w, bottom: 0.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(right: 6.w),
                                      child: Icon(
                                        Icons.paid,
                                        size: 18.w,
                                      ),
                                    ),
                                    Text("支付宝支付")
                                  ],
                                ),
                                Radio(
                                  value: "lafayette",
                                  groupValue: radio1,
                                  onChanged: (String? value) {
                                    setState(() {
                                      radio1 = value!;
                                    });
                                  },
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )),
          ],
        ),
        Positioned(
            bottom: 0,
            child: SizedBox(
              width: 1.sw,
              height: 50.w,
              child: Row(
                children: [
                  Expanded(
                      child: Container(
                          padding: EdgeInsets.only(right: 10.w),
                          height: double.infinity,
                          alignment: Alignment.centerRight,
                          decoration: const BoxDecoration(color: Colors.white),
                          child: Text.rich(TextSpan(children: [
                            TextSpan(text: "合计：", style: TextStyle(color: Colors.black, fontSize: 12.sp)),
                            TextSpan(text: "￥", style: TextStyle(color: Colors.red, fontSize: 12.sp)),
                            TextSpan(text: "276", style: TextStyle(color: Colors.red, fontSize: 22.sp))
                          ])))),
                  Container(
                    width: 140.w,
                    height: double.infinity,
                    decoration: const BoxDecoration(color: Colors.red),
                    child: Center(
                        child: Text(
                      "去支付",
                      style: TextStyle(color: Colors.white, fontSize: 18.sp),
                    )),
                  )
                ],
              ),
            ))
      ],
    ));
  }
}
