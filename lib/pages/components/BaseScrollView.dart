import 'package:flutter/cupertino.dart';

export '';

class BaseScrollView extends StatelessWidget {
  final Widget child;

  const BaseScrollView({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
        // behavior: MyBehavior(), //自定义behavior
        behavior: const ScrollBehavior().copyWith(overscroll: false),
        child: child);
  }
}
