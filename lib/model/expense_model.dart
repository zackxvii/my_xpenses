class ExpenseModel {
  int? id;
  String? title;
  String? desc;
  String? date;

  ExpenseModel({this.id, this.title, this.desc, this.date});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'desc': desc,
      'date': date,
    };
  }

  ExpenseModel.fromMap(Map<String, dynamic> expensesModel) {
    id = expensesModel['id'];
    title = expensesModel['title'];
    desc = expensesModel['desc'];
    date = expensesModel['date'];
  }
}
