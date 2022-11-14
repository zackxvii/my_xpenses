//Const Color
import 'package:flutter/material.dart';
import 'package:my_xpenses/shared/fontsize_shared.dart';
import 'package:sizer/sizer.dart';

const primaryColor = Color(0xFF85020C);
const secondaryColor = Color(0xFFBC1521);
const defaultColor = Colors.black;
const whiteColor = Colors.white;
const grey200 = Color.fromRGBO(238, 238, 238, 1);
const greyBg = Color.fromRGBO(238, 238, 238, 1);
const greyLess = Color(0xFFA09D9D);
const greyMoreLess = Color.fromRGBO(242, 240, 240, 0.796);
const greyThick = Color.fromARGB(255, 123, 121, 121);
const greyMoreThick = Color.fromARGB(255, 83, 80, 80);
const goldLess = Color.fromRGBO(222, 182, 22, 1);
const redNegative = Color.fromRGBO(211, 47, 47, 1);
const greeenPositive = Color.fromARGB(255, 43, 113, 46);
const grey1stGra = Color(0xFF6D6D6D);
const grey2ndGra = Color(0xFF454545);
const greyE7E7E7 = Color(0xFFE7E7E7);
const goldPending = Color.fromRGBO(251, 140, 0, 1);
const yellowF8F269 = Color(0xFFF8F269);
const brownText = Color(0xFF946D09);
const orangeAccept = Color(0xFFF8931D);

const List<Color> primayGradient = [
  secondaryColor,
  primaryColor,
];
const List<Color> secondaryGradient = [grey1stGra, grey2ndGra];

Widget headerText({required String text}) => Container(
      padding: EdgeInsets.only(
        bottom: 4.w,
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: AppText.px15.bold,
      ),
    );
Widget subHeaderText({required String text}) => Container(
      padding: EdgeInsets.only(bottom: 4.w),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: AppText.px17.w400.letterSpace(1.5),
      ),
    );

Widget titleText({required String text}) => Align(
      alignment: Alignment.bottomLeft,
      child: Text(
        text,
        textAlign: TextAlign.left,
        style: AppText.px15.wordSpace(1.5).w600,
      ),
    );

Widget subTitleText({required String text}) => Align(
      alignment: Alignment.bottomLeft,
      child: Text(
        text,
        textAlign: TextAlign.left,
        style: AppText.px15.wordSpace(1.5).w400,
      ),
    );

Widget subTitle18Text({required String text}) => Align(
      alignment: Alignment.bottomLeft,
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: AppText.px18.wordSpace(1.5).w400,
      ),
    );

Widget header20Text({required String text}) => Container(
      padding: EdgeInsets.only(bottom: 4.w),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: AppText.px20.bold,
      ),
    );
Widget header13Text({required String text}) => Container(
      padding: EdgeInsets.only(bottom: 4.w),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: AppText.px13.w600,
      ),
    );
Widget headerGreen({required String text}) => Container(
      padding: EdgeInsets.only(bottom: 4.w),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: AppText.px20.customColor(greeenPositive).bold,
      ),
    );
