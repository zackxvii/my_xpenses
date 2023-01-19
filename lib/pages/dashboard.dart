import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:my_xpenses/controller/expenses_controller.dart';
import 'package:my_xpenses/controller/item_controller.dart';
import 'package:my_xpenses/model/expense_model.dart';
import 'package:my_xpenses/shared/appbar_shared.dart';
import 'package:my_xpenses/shared/fontcolor_shared.dart';
import 'package:my_xpenses/shared/fontsize_shared.dart';
import 'package:my_xpenses/util/theme.dart';
import '../shared/speed_dial_shared.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  var selectedfABLocation = FloatingActionButtonLocation.endFloat;
  ExpensesController ec = Get.put(ExpensesController());
  ItemController _itemController = Get.put(ItemController());

  @override
  void initState() {
    ec.getExpenses();
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
    return Obx(
      (() {
        if (ec.expensesList.isEmpty) {
          return _expenseEmpty();
        } else {
          return ListView.builder(
            itemCount: ec.expensesList.length,
            itemBuilder: (BuildContext context, int index) {
              ExpenseModel em = ec.expensesList[index];
              return Slidable(
                key: const ValueKey(0),
                endActionPane: ActionPane(
                  motion: const ScrollMotion(),
                  children: [
                    SlidableAction(
                      onPressed: ((context) => {ec.deleteExpenses(em.id)}),
                      backgroundColor: const Color(0xFFFE4A49),
                      foregroundColor: Colors.white,
                      icon: Icons.delete,
                      label: 'Delete',
                    ),
                  ],
                ),
                // The child of the Slidable is what the user sees when the
                // component is not dragged.
                child: ListTile(
                  title: Text(
                    em.title!,
                    textScaleFactor: 1.5,
                  ),
                  trailing: const Icon(Icons.edit),
                  subtitle: Text(em.desc.toString()),
                  selected: true,
                  onTap: () {
                    setState(
                      () {
                        txt = 'List Tile pressed';
                        Get.toNamed(path, arguments: em.id!);
                      },
                    );
                  },
                ),
              );
            },
          );
        }
      }),
    );
  }

  Widget _expenseEmpty() {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MediaQuery.of(context).orientation == Orientation.portrait
                ? const SizedBox(
                    height: 0,
                  )
                : const SizedBox(
                    height: 50,
                  ),
            SvgPicture.asset(
              'assets/images/task.svg',
              height: 200,
              color: darkGreyClr.withOpacity(0.5),
              semanticsLabel: 'Tasks',
            ),
            const SizedBox(
              height: 20,
            ),
            const Text("Empty"),
          ],
        ),
      ),
    );
  }
}
