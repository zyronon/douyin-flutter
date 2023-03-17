import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

export '';

class Gang extends StatelessWidget {
  const Gang(this.title, {super.key});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Container(
        margin: EdgeInsets.only(right: 8.w),
        height: 16.w,
        width: 3.w,
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(2.w),
        ),
        child: null,
      ),
      Text(
        title,
        style: TextStyle(fontSize: 14.sp, color: Colors.black),
      ),
    ]);
  }
}
