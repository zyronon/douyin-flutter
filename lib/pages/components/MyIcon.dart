import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
export '';

class MyIcon extends StatelessWidget {
  const MyIcon({
    super.key,
    required this.title,
    required this.img,
    required this.cb,
  });

  final String title;
  final String img;
  final void Function() cb;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 1,
        child: InkWell(
          onTap: cb,
          child: Column(
            children: [
              Image.asset(
                img,
                width: 70.0,
              ),
              Text(
                title,
                style: const TextStyle(color: Colors.black, fontSize: 18),
              )
            ],
          ),
        ));
  }
}
