import 'package:besic/constant.dart';
import 'package:flutter/material.dart';

Widget AppBarWidget() {
  return Text.rich(
    TextSpan(
      children: [
        TextSpan(
          text: "Dream",
          style: TextStyle(
              fontSize: 25,
              color: ConstantColors.gold,
              fontWeight: FontWeight.w900),
        ),
      ],
      text: "WallPaper ",
      style:
          TextStyle(color: ConstantColors.black, fontWeight: FontWeight.w700),
    ),
  );
}
