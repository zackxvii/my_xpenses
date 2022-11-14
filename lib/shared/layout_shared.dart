import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:my_xpenses/shared/fontcolor_shared.dart';
import 'package:my_xpenses/shared/fontsize_shared.dart';
import 'package:my_xpenses/shared/header_shape.dart';
import 'package:my_xpenses/shared/keyboard_shared.dart';
import 'package:my_xpenses/shared/size_shared.dart';

class ScreenLayoutWidget extends StatelessWidget {
  final String title;
  final Widget? leading;
  final List<Widget>? actions;
  final Widget? headerContent;
  final Widget? cardContent;
  final double? cardHeight;
  final Widget? body;
  final Widget? bottomSheet;
  final BoxShape? cardShape;
  final CustomClipper<Path>? clipper;
  final double? clipperHeight;
  final bool? needCard;
  final bool? resizeToAvoidBottomInset;
  final bool? safeBtm;
  const ScreenLayoutWidget(
      {Key? key,
      required this.title,
      this.leading,
      this.actions,
      this.headerContent,
      this.cardContent,
      this.cardHeight,
      this.body,
      this.bottomSheet,
      this.cardShape,
      this.clipper,
      this.needCard,
      this.clipperHeight,
      this.resizeToAvoidBottomInset,
      this.safeBtm})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return KeyboardUnfocusFunction(
      child: ColorfulSafeArea(
        color: primaryColor,
        bottom: false,
        child: Scaffold(
            resizeToAvoidBottomInset: resizeToAvoidBottomInset ?? false,
            appBar: AppBar(
              centerTitle: true,
              leading: leading,
              title: Text(
                title,
                style: AppText.px15.w600.customColor(whiteColor).letterSpace(2),
              ),
              actions: actions,
              backgroundColor: primaryColor,
            ),
            backgroundColor: Colors.grey[200],
            body: SafeArea(
              bottom: safeBtm ?? true,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      ClipPath(
                        clipper: clipper ?? HeaderShape(),
                        child: Container(
                            height: headerContent != null
                                ? clipperHeight ?? 160
                                : 90,
                            color: primaryColor),
                      ),
                      headerContent ?? const SizedBox(),
                      Column(
                        children: [
                          needCard ?? true
                              ? Padding(
                                  padding: EdgeInsets.only(
                                      left: 15,
                                      right: 15,
                                      bottom: 10,
                                      top: headerContent != null ? 70 : 10),
                                  child: Center(
                                    child: Container(
                                      decoration: BoxDecoration(
                                          shape:
                                              cardShape ?? BoxShape.rectangle,
                                          borderRadius: cardShape == null
                                              ? BorderRadius.circular(10)
                                              : null,
                                          color: whiteColor),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 15, vertical: 10),
                                        child: cardContent,
                                      ),
                                    ),
                                  ),
                                )
                              : Container(),
                        ],
                      ),
                    ],
                  ),
                  body ?? const SizedBox()
                ],
              ),
            ),
            bottomSheet: Padding(
              padding: EdgeInsets.only(bottom: Height.sizedbox_height_15),
              child: bottomSheet,
            )),
      ),
    );
  }
}
