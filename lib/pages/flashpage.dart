import 'package:flutter/material.dart';
import 'package:my_xpenses/shared/fontcolor_shared.dart';
import 'package:my_xpenses/shared/fontsize_shared.dart';
import 'package:my_xpenses/shared/size_shared.dart';

class FlashPage extends StatefulWidget {
  const FlashPage({super.key});

  @override
  State<FlashPage> createState() => _FlashPageState();
}

class _FlashPageState extends State<FlashPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            Text(
              "Welcome Back Zakwan!",
              style: AppText.px17.w600.customColor(whiteColor).letterSpace(2),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Text(
              "Balance: RM 1980.00",
              style: AppText.px15.w100.customColor(whiteColor).letterSpace(2),
            ),
          ],
        ),
        elevation: 2.0,
        backgroundColor: primaryColor,
        toolbarHeight: 100,
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
                // Get.to(() => const NotificationScreen());
              },
            ),
          ),
        ],
      ),
      body: Center(
          child: Column(
        children: const <Widget>[Text("data"), Text("data")],
      )),
    );
  }
}
