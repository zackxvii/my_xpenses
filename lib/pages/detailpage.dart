import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:my_xpenses/controller/expenses_controller.dart';
import 'package:my_xpenses/controller/item_controller.dart';
import 'package:my_xpenses/model/exp_list_model.dart';
import 'package:my_xpenses/shared/appbar_shared.dart';
import 'package:my_xpenses/shared/fontcolor_shared.dart';
import 'package:my_xpenses/shared/fontsize_shared.dart';
import 'package:my_xpenses/util/theme.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  final expenseID = Get.arguments;
  final ItemController _itemController = Get.find();
  bool? isLoading = true;

  @override
  void initState() {
    setState(() {
      _itemController.getItemList();
      isLoading = false;
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarShared(
        height: 80,
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
              "RM 1980.00",
              style: AppText.px15.w100.customColor(whiteColor).letterSpace(2),
            ),
          ],
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.all(0),
          child: Obx(
            () {
              return ListView.builder(
                itemCount: _itemController.itemList.length,
                itemBuilder: (BuildContext context, int index) {
                  ExpenseListModel em = _itemController.itemList[index];
                  return Slidable(
                    key: const ValueKey(0),
                    endActionPane: ActionPane(
                      motion: const ScrollMotion(),
                      children: [
                        SlidableAction(
                          onPressed: ((context) => {}),
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
                        em.itemId.toString(),
                        textScaleFactor: 1.5,
                      ),
                      trailing: const Icon(Icons.edit),
                      subtitle: Text(em.itemName.toString()),
                      selected: true,
                      onTap: () {
                        setState(
                          () {},
                        );
                      },
                    ),
                  );
                },
              );
            },
          )
          // GetBuilder<ItemController>(
          //   builder: ((controller) {
          //     return isLoading!
          //         ? const Center(
          //             child: CircularProgressIndicator(),
          //           )
          //     : DataTable2(
          //         columnSpacing: 12,
          //         horizontalMargin: 12,
          //         minWidth: 200,
          //         columns: [
          //           DataColumn2(
          //             label: Text('Item'),
          //             size: ColumnSize.L,
          //           ),
          //           DataColumn(
          //             label: Text('Allocated Budget'),
          //           ),
          //           DataColumn(
          //             label: Text('Spend'),
          //           ),
          //           DataColumn(
          //             label: Text('Balance'),
          //           ),
          //         ],
          //         rows: List<DataRow>.generate(
          //           _itemController.itemList.length,
          //           (index) => DataRow(cells: [
          //             DataCell(Text(
          //                 '${_itemController.itemList[index].itemName}')),
          //             DataCell(Text('B' * (10 - (index + 5) % 10))),
          //             DataCell(Text('C' * (15 - (index + 5) % 10))),
          //             DataCell(Text('D' * (15 - (index + 10) % 10))),
          //           ]),
          //         ),
          //       );
          //   }),
          // ),
          ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed('/additem', arguments: expenseID);
          print(_itemController.itemList.length);
        },
        backgroundColor: primaryClr,
        child: const Icon(Icons.add),
      ),
    );
  }
}
