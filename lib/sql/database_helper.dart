import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  late Database db;

  Future open() async {
    // Get a location using getDatabasesPath
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'demo.db');
    //join is from path package
    print(
        path); //output /data/user/0/com.testapp.flutter.testapp/databases/demo.db

    db = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      // When creating the db, create the table
      await db.execute('''=
                    CREATE TABLE IF NOT EXISTS expenses( 
                          id primary key,
                          month varchar(255) not null,
                          description varchar(255) not null
                      );
                  ''');
      //table students will be created if there is no table 'students'
      print("Table Created");
    });
  }

  Future<Map<dynamic, dynamic>?> getStudent(int id) async {
    List<Map> maps =
        await db.query('expenses', where: 'id = ?', whereArgs: [id]);
    //getting student data with roll no.
    if (maps.isNotEmpty) {
      return maps.first;
    }
    return null;
  }
}
