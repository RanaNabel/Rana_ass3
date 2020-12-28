import 'package:ass3/task.model.dart';
import 'package:path/path.dart';
import 'package:sqflite/aqflite.dart';

class DBHelper {
  DBHelper._();
  static DBHelper dpHelper = DBHelper._();
  static final String databaseName = 'tasksdb.db';
  static final String tableName = 'tasksdb.db';
  static final String taskIdColumnName = 'id';
  static final String taskNameColumnName = 'name';
  static final String taskIsCompleteColumnName = 'IsComplete';

  Database database;
  Future<Database> intiDatabase() async {
    if (database == null) {
      return await createDatabase();
    } else {
      return database;
    }
  }

  // ignore: missing_return
  Future<Database> createDatabase() async {
    try {
      var databasesPath = await getDatabasesPath();
      String path = join(databasesPath, 'databaseName');
      // databasesPath + '/demo.db';
      Database database = await openDatabase(
        path,
        version: 1,
        onCreate: (db, version) {
          db.execute('''CREATE TABLE $tableName(
            $taskIdColumnName INTEGER PRIMARY KEY AUTOINCREMENT,
            $taskNameColumnName TEXT NOY NULL,
            $taskIdColumnName INTEGER
          )''');
        },
      );
      return database;
    } on Exception catch (e) {
      print(e);
    }
  }

  insertNewTask(Task task) async {
    try {
      database = await intiDatabase();
      int x = await database.insert(tableName, task.toJson());
      print(x);
    } on Exception catch (e) {
      print(e);
    }
  }

  // ignore: missing_return
  Future<List<Map>> selectAllTask() async {
    try {
      database = await intiDatabase();
      List<Map> result = await database.query(tableName);
      print(result);
    } on Exception catch (e) {
      print(e);
    }
  }

  // ignore: missing_return
  Future<Map> selectSpecificTask(String name) async {
    try {
      database = await intiDatabase();
      List<Map> result = await database
          .query(tableName, where: '$taskNameColumnName =?', whereArgs: [name]);
      print(result);
    } on Exception catch (e) {
      print(e);
    }
  }

  updateTask(Task task) async {
    try {
      database = await intiDatabase();
      int result = await database.update(tableName, task.toJson(),
          where: '$taskNameColumnName =?', whereArgs: [task.taskName]);
      print(result);
    } on Exception catch (e) {
      print(e);
    }
  }

  deleteask(Task task) async {
    try {
      database = await intiDatabase();
      int result = await database.delete(tableName,
          where: '$taskNameColumnName =?', whereArgs: [task.taskName]);
      print(result);
    } on Exception catch (e) {
      print(e);
    }
  }
}
