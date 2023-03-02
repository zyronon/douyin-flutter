import 'package:flutter/widgets.dart';

export '';

class MyCard extends StatelessWidget {
  const MyCard({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
          minWidth: double.infinity, //宽度尽可能大
          minHeight: 50.0 //最小高度为50像素
          ),
      child: Container(
          margin: const EdgeInsets.only(top: 10.0),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: const Color.fromRGBO(220, 220, 220, 1.0),
            borderRadius: BorderRadius.circular(8),
          ),
          child: child),
    );
  }
}
