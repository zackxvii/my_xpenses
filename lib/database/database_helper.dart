import 'package:my_xpenses/model/exp_list_model.dart';
import 'package:my_xpenses/model/expense_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  static const databaseName = 'expenses.db';
  static const expensetable = 'expenses_table';
  static const itemtable = 'item_table';
  static const _databaseVersion = 1;
  static Database? _database;

  _initDB() async {
    String path = join(await getDatabasesPath(), databaseName);

    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  Future<Database> get database async {
    if (_database != null) return _database!;
    // lazily instantiate the db the first time it is accessed
    _database = await _initDB();
    return _database!;
  }

  _onCreate(Database db, int version) async {
    await db.execute('CREATE TABLE $expensetable('
        'id INTEGER PRIMARY KEY AUTOINCREMENT, title STRING NOT NULL, desc STRING'
        ')');
    await db.execute('CREATE TABLE $itemtable('
        'itemId INTEGER PRIMARY KEY AUTOINCREMENT, expensesTableid INTEGER NOT NULL, itemName STRING NOT NULL, budget STRING NOT NULL'
        ')');
  }

  Future<int> createExpenses(ExpenseModel exp) async {
    Database? db = await DBHelper._database;
    return await db!.insert(expensetable, {
      'title': exp.title,
      'desc': exp.desc,
      // 'date': exp.date,
    });
  }

  Future<List<Map<String, dynamic>>> queryAllRows() async {
    Database? db = await DBHelper._database;
    return await db!.query(expensetable);
  }

  Future getExpenseByID(int id) async {
    Database? db = await DBHelper._database;
    List p = await db!.rawQuery('SELECT * FROM expenses_table where id=$id');
    print(p);
    return await db!.rawQuery('SELECT * FROM $expensetable where id=$id');
  }

  Future<int> delete(int id) async {
    Database? db = await DBHelper._database;
    return await db!.delete(expensetable, where: 'id = ?', whereArgs: [id]);
  }

  Future<int> deleteAllTasks() async {
    Database? db = await DBHelper._database;
    return await db!.delete(expensetable);
  }

  Future<int> update(int id) async {
    return await _database!.rawUpdate('''
    UPDATE $expensetable
    SET isCompleted = ?, color = ?
    WHERE id = ?
    ''', [1, 1, id]);
  }

  Future<List<Map<String, dynamic>>> queryAllRowsItem() async {
    Database? db = await DBHelper._database;
    return await db!.query(itemtable);
  }

  //create item
  Future<int> createItem(ExpenseListModel explist) async {
    Database? db = DBHelper._database;
    print('dlm helper: ${explist.expensesTableid}');
    print('dlm helper: ${explist.itemName}');
    return await db!.insert(itemtable, {
      'expensesTableid': explist.expensesTableid,
      'itemName': explist.itemName,
      'budget': explist.budget,
    });
  }
}
