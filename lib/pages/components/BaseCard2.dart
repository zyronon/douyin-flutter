import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

export '';

class BaseCard2 extends StatelessWidget {
  const BaseCard2({
    super.key,
    required this.child,
    this.needPadding,
  });

  final Widget child;
  final bool? needPadding;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 8.w),
      color: Colors.white,
      padding: needPadding == true ? EdgeInsets.all(8.w) : null,
      child: child,
    );
  }
}
