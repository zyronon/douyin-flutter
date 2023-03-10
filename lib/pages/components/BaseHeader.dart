import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hope/utils/ConstVal.dart';

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
    return SizedBox(
        width: double.infinity,
        height: headerHeight,
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
                          width: headerHeight,
                          child: const Center(
                              child: Icon(
                            Icons.arrow_back_ios,
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
                      style: TextStyle(color: Colors.black, fontSize: 22.sp),
                    ),
                ],
              ),
            )
          ],
        ));
  }
}
