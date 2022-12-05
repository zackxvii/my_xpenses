import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_xpenses/shared/fontcolor_shared.dart';
import 'package:my_xpenses/shared/size_shared.dart';

class AppBarShared extends StatelessWidget implements PreferredSizeWidget {
  final Widget child;
  final double height;
  const AppBarShared({super.key, required this.child, required this.height});

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: child,
      elevation: 2.0,
      backgroundColor: primaryColor,
      toolbarHeight: height,
      centerTitle: true,
      actions: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: Width.appBarBellPadding),
          child: InkWell(
            child: const Icon(
              Icons.notifications,
              color: whiteColor,
            ),
            onTap: () async {
              Get.toNamed('/additem');
            },
          ),
        ),
      ],
    );
  }
}
