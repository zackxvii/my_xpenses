import 'package:get/get.dart';
import 'package:my_xpenses/database/database_helper.dart';
import 'package:my_xpenses/model/exp_list_model.dart';

class ItemController extends GetxController {
  final RxList itemList = <ExpenseListModel>[].obs;

  Future<void> getItemList() async {
    final List<Map<String, dynamic>> exp = await DBHelper().queryAllRows();
    itemList
        .assignAll(exp.map((data) => ExpenseListModel.fromMap(data)).toList());
  }

  addItem(ExpenseListModel exp) async {
    await DBHelper().createItem(exp);
    itemList.add(exp);
    getItemList();
  }

  deleteItem(int? id) async {
    await DBHelper().delete(id!);
    getItemList();
  }

  deleteAllItem() async {
    await DBHelper().deleteAllTasks();
    getItemList();
  }

  markAsCompleted(int? id) async {
    await DBHelper().update(id!);
    getItemList();
  }
}
