import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

export '';

class BaseHeader extends StatelessWidget {
  const BaseHeader({
    super.key,
    this.title,
    this.showBack = true,
  });

  final String? title;
  final bool showBack;

  @override
  Widget build(BuildContext context) {
    double height = 40.h;
    return SizedBox(
        width: double.infinity,
        height: height,
        // padding: const EdgeInsets.only(left: 15, right: 15),
        child: Stack(
          alignment: Alignment.center,
          children: [
            if (showBack)
              SizedBox(
                height: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () => {Navigator.pop(context)},
                      child: SizedBox(
                          width: height,
                          child: Center(
                              child: Image.asset(
                            "images/light-back.png",
                            width: 15.w,
                          ))),
                    ),
                    const Text("")
                  ],
                ),
              ),
            SizedBox(
              height: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (title != null)
                    Text(
                      title!,
                      style: TextStyle(color: Colors.white, fontSize: 22.sp),
                    ),
                ],
              ),
            )
          ],
        ));
  }
}
