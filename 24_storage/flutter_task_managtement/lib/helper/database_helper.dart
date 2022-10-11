import 'package:flutter_task_managtement/models/task_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static DatabaseHelper? _databaseHelper;
  late Database _database;
  final String _tableTasks = 'tasks';

  DatabaseHelper._internal() {
    _databaseHelper = this;
  }

  factory DatabaseHelper() => _databaseHelper ?? DatabaseHelper._internal();

  Future<Database> get database async {
    _database = await _initializeDb();
    return _database;
  }

  Future<Database> _initializeDb() async {
    var db = await openDatabase(
      join(await getDatabasesPath(), 'task_db.db'),
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE $_tableTasks (
            id TEXT PRIMARY KEY, 
            taskName TEXT
          )
        ''');
      },
      onUpgrade: (db, oldVersion, newVersion) async {
        await db.execute('DROP TABLE $_tableTasks');
        await db.execute('''
          CREATE TABLE $_tableTasks (
            id TEXT PRIMARY KEY, 
            taskName TEXT,
            status BOOL,
          )
        ''');
      },
      version: 1,
    );
    return db;
  }

  Future<void> insertTask(TaskModel task) async {
    final Database db = await database;
    await db.insert(_tableTasks, task.toMap());
  }

  Future<List<TaskModel>> getTasks() async {
    final Database db = await database;
    List<Map<String, dynamic>> results = await db.query(_tableTasks);
    return results.map((taskMap) => TaskModel.fromMap(taskMap)).toList();
  }

  Future<TaskModel> getTaskById(String id) async {
    final Database db = await database;
    List<Map<String, dynamic>> results = await db.query(
      _tableTasks,
      where: 'id = ?',
      whereArgs: [id],
    );
    return results.map((taskMap) => TaskModel.fromMap(taskMap)).first;
  }

  Future<bool> updateTask(TaskModel task) async {
    final Database db = await database;
    final result = await db.update(
      _tableTasks,
      task.toMap(),
      where: 'id = ?',
      whereArgs: [task.id],
    );
    return result > 0 ? true : false;
  }

  Future<bool> deleteTask(String id) async {
    final Database db = await database;
    final result = await db.delete(
      _tableTasks,
      where: 'id = ?',
      whereArgs: [id],
    );
    return result > 0 ? true : false;
  }
}
