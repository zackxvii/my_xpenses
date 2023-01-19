class ExpenseListModel {
  int? itemId;
  int? expensesTableid;
  String? itemName;
  double? budget;

  ExpenseListModel({
    this.itemId,
    this.expensesTableid,
    this.itemName,
    this.budget,
  });

  Map<String, dynamic> toMap() {
    return {
      'itemId': itemId,
      'expensesTableid': expensesTableid,
      'itemName': itemName,
      'budget': budget,
    };
  }

  ExpenseListModel.fromMap(Map<String, dynamic> list) {
    itemId = list['itemId'];
    expensesTableid = list['expensesTableid'];
    itemName = list['itemName'];
    budget = list['budget'];
  }
}
