class ExpenseListModel {
  int? itemId;
  // int? expensesTableid;
  String? itemName;
  // double? budget;
  // String? date;

  ExpenseListModel({
    this.itemId,
    // this.expensesTableid,
    this.itemName,
    // this.budget,
    //this.date
  });

  Map<String, dynamic> toMap() {
    return {
      'itemId': itemId,
      // 'expensesTableid': expensesTableid,
      'itemName': itemName,
      // 'budget': budget,
      // 'date': date,
    };
  }

  ExpenseListModel.fromMap(Map<String, dynamic> list) {
    itemId = list['itemId'];
    // expensesTableid = list['expensesTableid'];
    itemName = list['itemName'];
    // budget = list['budget'];
    // date = list['date'];
  }
}
