import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hope/utils/ConstVal.dart';

export '';

class BaseHeader extends StatelessWidget {
  const BaseHeader({
    super.key,
    this.title,
    this.showBack = true,
    this.rightWidget,
  });

  final String? title;
  final bool showBack;
  final Widget? rightWidget;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 1.sw,
        height: headerHeight,
        // padding: const EdgeInsets.only(left: 15, right: 15),
        child: Stack(
          alignment: Alignment.center,
          children: [
            if (showBack)
              Positioned(
                left: 0,
                child: InkWell(
                  onTap: () => {Navigator.pop(context)},
                  child: SizedBox(
                    width: headerHeight,
                    height: headerHeight,
                    child: Center(
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                        size: 18.w,
                      ),
                    ),
                  ),
                ),
              ),
            if (title != null)
              Text(
                title!,
                style: TextStyle(color: Colors.black, fontSize: 16.sp),
              ),
            if (rightWidget != null) Positioned(right: 0, bottom: 0, top: 0, child: rightWidget!)
          ],
        ));
  }
}
