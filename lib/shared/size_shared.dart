// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Height {
  static final double sizedbox_height_10 = 1.23.h;
  static final double sizedbox_height_15 = 1.85.h;
  static final double sizedbox_height_20 = 2.46.h;
  static final double sizedbox_height_25 = 3.08.h;
  static final double sizedbox_height_30 = 3.69.h;
  static final double sizedbox_height_35 = 4.31.h;
}

class Width {
  static final double sizedbox_width_10 = 2.66.w;
  static final double sizedbox_width_15 = 4.w;
  static final double sizedbox_width_20 = 5.33.w;
  static final double sizedbox_width_24 = 6.4.w;
  static final double appBarBellPadding = 4.w;
}

final defaultPadding = 4.2.w;

Widget fontComparison({required double pxSize, required double spSize}) {
  return SizedBox(
    height: 8.h,
    width: 100.w,
    child: Stack(
      children: [
        Text(
          "this is size ---- $pxSize px",
          style: TextStyle(
            fontSize: pxSize,
            fontWeight: FontWeight.w700,
            color: Colors.red,
          ),
        ),
        Text(
          "this is size ----                           $spSize sp",
          style: TextStyle(
            fontSize: spSize.sp,
            fontWeight: FontWeight.w700,
            color: Colors.blue.withOpacity(0.6),
          ),
        )
      ],
    ),
  );
}
