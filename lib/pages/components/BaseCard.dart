import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

export '';

class BaseCard extends StatelessWidget {
  const BaseCard({super.key, required this.child, this.title, this.titleWidget});

  final Widget child;
  final String? title;
  final Widget? titleWidget;

  getChild() {
    if (title != null) {
      return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
          padding: EdgeInsets.only(left: 8.w, bottom: 8.w),
          child: Text(title!),
        ),
        child
      ]);
    }
    if (titleWidget != null) {
      return Column(children: [titleWidget!, child]);
    }
    return child;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minWidth: double.infinity, minHeight: 50.0),
      margin: const EdgeInsets.only(top: 10.0),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: getChild(),
    );
  }
}
