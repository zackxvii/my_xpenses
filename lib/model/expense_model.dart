class ExpenseModel {
  int? id;
  String? title;
  String? desc;

  ExpenseModel({this.id, this.title, this.desc});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'desc': desc,
    };
  }

  ExpenseModel.fromMap(Map<String, dynamic> expensesModel) {
    id = expensesModel['id'];
    title = expensesModel['title'];
    desc = expensesModel['desc'];
  }
}
