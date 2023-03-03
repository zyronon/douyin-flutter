import 'package:flutter/material.dart';

export '';

class MyHeader extends StatelessWidget {
  const MyHeader({super.key, this.title});

  final String? title;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 50,
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset("images/light-back.png", width: 20.0),
            if (title != null)
              Text(
                title!,
                style: const TextStyle(color: Colors.white, fontSize: 26),
              ),
            const Text("")
          ],
        ));
  }
}
