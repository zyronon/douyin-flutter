import 'package:flutter/material.dart';

export '';

class Gang extends StatelessWidget {
  const Gang({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 8),
      height: 20,
      width: 4,
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(2),
      ),
      child: null,
    );
  }
}
