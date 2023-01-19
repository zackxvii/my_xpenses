import 'package:get/get.dart';
import 'package:my_xpenses/database/database_helper.dart';
import 'package:my_xpenses/model/exp_list_model.dart';

class ItemController extends GetxController {
  var itemList = <ExpenseListModel>[].obs;

  Future<void> getItemList() async {
    final List<Map<String, dynamic>> list = await DBHelper().queryAllRowsItem();
    itemList
        .assignAll(list.map((data) => ExpenseListModel.fromMap(data)).toList());
    print(itemList.length);
  }

  addItem(ExpenseListModel exp) async {
    await DBHelper().createItem(exp);
    itemList.add(exp);
    print('dlm item controller: ${itemList.length}');
    print('dlm item controller: ${exp.itemName}');
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
