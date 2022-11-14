import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

extension TextStyleHelper on TextStyle {
  TextStyle get w100 => copyWith(fontWeight: FontWeight.w100);
  TextStyle get w200 => copyWith(fontWeight: FontWeight.w200);
  TextStyle get w300 => copyWith(fontWeight: FontWeight.w300);
  TextStyle get w400 => copyWith(fontWeight: FontWeight.w400);
  TextStyle get w500 => copyWith(fontWeight: FontWeight.w500);
  TextStyle get w600 => copyWith(fontWeight: FontWeight.w600);
  TextStyle get w700 => copyWith(fontWeight: FontWeight.w700);
  TextStyle get w800 => copyWith(fontWeight: FontWeight.w800);
  TextStyle get w900 => copyWith(fontWeight: FontWeight.w900);
  TextStyle get ls1p5 => copyWith(letterSpacing: 1.5);
  TextStyle get ls2p0 => copyWith(letterSpacing: 6.0);
  TextStyle get bold => copyWith(fontWeight: FontWeight.bold);
  TextStyle customColor(Color value) => copyWith(color: value);
  TextStyle customSize(double value) => copyWith(fontSize: value);
  TextStyle customHeight(double value) => copyWith(height: value);
  TextStyle letterSpace(double value) => copyWith(letterSpacing: value);
  TextStyle wordSpace(double value) => copyWith(wordSpacing: value);
  TextStyle get underline => copyWith(decoration: TextDecoration.underline);
  TextStyle get lineThrough => copyWith(decoration: TextDecoration.lineThrough);
}

class IconSize {
  static final double px10 = 7.7.sp;
  static final double px12 = 9.2.sp;
  static final double px13 = 10.sp;
  static final double px14 = 10.8.sp;
  static final double px15 = 11.5.sp;
  static final double px16 = 12.3.sp;
  static final double px17 = 13.1.sp;
  static final double px18 = 13.8.sp;
  static final double px20 = 15.5.sp;
  static final double px22 = 16.6.sp;
  static final double px23 = 17.6.sp;
  static final double px24 = 18.5.sp;
  static final double px26 = 20.0.sp;
  static final double px30 = 23.1.sp;
}

class AppText extends TextTheme {
  static final px10 = TextStyle(
    fontSize: 7.7.sp,
  );
  static final px12 = TextStyle(
    fontSize: 9.2.sp,
  );
  static final px13 = TextStyle(
    fontSize: 10.0.sp,
  );
  static final px14 = TextStyle(
    fontSize: 10.8.sp,
  );
  static final px15 = TextStyle(
    fontSize: 11.5.sp,
  );
  static final px16 = TextStyle(
    fontSize: 12.3.sp,
  );
  static final px17 = TextStyle(
    fontSize: 13.1.sp,
  );
  static final px18 = TextStyle(
    fontSize: 13.8.sp,
  );
  static final px20 = TextStyle(
    fontSize: 15.5.sp,
  );
  static final px22 = TextStyle(
    fontSize: 16.6.sp,
  );
  static final px23 = TextStyle(
    fontSize: 17.6.sp,
  );
  static final px24 = TextStyle(
    fontSize: 18.5.sp,
  );
  static final px26 = TextStyle(
    fontSize: 20.0.sp,
  );
  static final px30 = TextStyle(
    fontSize: 23.1.sp,
  );
}
