import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_xpenses/shared/appbar_shared.dart';
import 'package:my_xpenses/shared/fontcolor_shared.dart';
import 'package:my_xpenses/shared/fontsize_shared.dart';
import '../shared/speed_dial_shared.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  var selectedfABLocation = FloatingActionButtonLocation.endFloat;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarShared(
        height: 100,
        child: Column(
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
      ),
      body: Column(
        children: [
          firstPart(),
          Expanded(child: secondPart('/detailpage')),
        ],
      ),
      floatingActionButtonLocation: selectedfABLocation,
      floatingActionButton: const SpeedDialWidget(),
    );
  }

  firstPart() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Dashboard",
            style: AppText.px17.w600.customColor(defaultColor).letterSpace(2),
          ),
          const Divider(),
        ],
      ),
    );
  }

  secondPart(String path) {
    String txt = '';
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: const Text(
            'November 2022',
            textScaleFactor: 1.5,
          ),
          trailing: const Icon(Icons.edit),
          subtitle: const Text('Expenses for this month'),
          selected: true,
          onTap: () {
            setState(
              () {
                txt = 'List Tile pressed';
                Get.toNamed(path);
              },
            );
          },
        );
      },
    );
  }
}
