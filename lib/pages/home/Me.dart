import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hope/pages/components/BaseCard.dart';
import 'package:hope/pages/components/BaseHeader.dart';
import 'package:hope/pages/components/BaseIcon.dart';
import 'package:hope/utils/ConstVal.dart';

export '';

class Me extends StatefulWidget {
  const Me({super.key});

  @override
  State<StatefulWidget> createState() => _MeState();
}

class _MeState extends State<Me> {
  String url = 'https://picsum.photos/200';

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const BaseHeader(title: "我", showBack: false),
      Container(
        padding: EdgeInsets.fromLTRB(18.w, headerHeight + 10.w, 18.w, 18.w),
        decoration: const BoxDecoration(image: DecorationImage(image: AssetImage('images/9.jpg'), fit: BoxFit.cover)),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 18.w, 0),
                  child: CircleAvatar(
                    maxRadius: 35.w,
                    backgroundImage: NetworkImage(url),
                  )),
              Expanded(
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 8.w, top: 8.w),
                  child: Text(
                    "骗哥们可以",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: TextStyle(
                      fontSize: 16.sp,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 8.w),
                  child: Text(
                    "账号:2131346",
                    style: TextStyle(fontSize: 10.sp, color: Colors.grey),
                  ),
                ),
              ]))
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 12.w),
            child: Text(
              "骗哥们可以",
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: TextStyle(
                fontSize: 14.sp,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 12.w),
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(5.w, 1.w, 5.w, 1.w),
                  decoration: BoxDecoration(color: Colors.grey, borderRadius: BorderRadius.all(Radius.circular(3.w))),
                  child: Text("女", style: TextStyle(color: Colors.white, fontSize: 8.sp)),
                )
              ],
            ),
          )
        ]),
      ),
      Container(
        padding: pagePadding,
        child: Column(
          children: [
            BaseCard(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, 'Login');
                  },
                  child: Text('登录'),
                ),
              ],
            )),
            BaseCard(
                title: '其他功能',
                child: Column(
                  children: [
                    Flex(
                      direction: Axis.horizontal,
                      children: [
                        BaseIcon(
                          title: '设置',
                          img: "images/gray-close-full.png",
                        ),
                        BaseIcon(
                          title: '联系客服',
                          img: "images/gray-close-full.png",
                        ),
                        BaseIcon(
                          title: '地址管理',
                          img: "images/gray-close-full.png",
                        ),
                        BaseIcon(
                          title: '投诉管理',
                          img: "images/gray-close-full.png",
                        ),
                      ],
                    ),
                    // Flex(
                    //   direction: Axis.horizontal,
                    //   children: [
                    //     BaseIcon(
                    //       flex: 0,
                    //       title: '投诉管理',
                    //       img: "images/gray-close-full.png",
                    //       cb: () => {print('2')},
                    //     ),
                    //   ],
                    // ),
                  ],
                )),
          ],
        ),
      )
    ]);
  }
}
