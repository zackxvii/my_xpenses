class ExpenseListModel {
  int? itemId;
  String? itemName;
  double? budget;
  String? date;

  ExpenseListModel({this.itemId, this.itemName, this.budget, this.date});

  Map<String, dynamic> toMap() {
    return {
      'itemId': itemId,
      'itemName': itemName,
      'budget': budget,
      'date': date,
    };
  }

  ExpenseListModel.fromMap(Map<String, dynamic> list) {
    itemId = list['itemId'];
    itemName = list['itemName'];
    budget = list['budget'];
    date = list['date'];
  }
}
