import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
export '';

class BaseIcon extends StatelessWidget {
  const BaseIcon({
    super.key,
    required this.title,
    required this.img,
    required this.cb,
    this.flex = 1,
  });

  final String title;
  final String img;
  final int flex;
  final void Function() cb;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: flex,
        child: InkWell(
          onTap: cb,
          child: Column(
            children: [
              Image.asset(
                img,
                width: 60.w,
              ),
              Padding(
                padding: EdgeInsets.only(top: 6.w),
                child: Text(
                  title,
                  style: TextStyle(color: Colors.black, fontSize: 14.sp),
                ),
              )
            ],
          ),
        ));
  }
}
