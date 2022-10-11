import 'package:flutter/foundation.dart';
import 'package:flutter_task_managtement/helper/database_helper.dart';
import 'package:flutter_task_managtement/models/task_model.dart';

class DbManager with ChangeNotifier {
  List<TaskModel> _tasks = [];
  late DatabaseHelper _dbHelper;

  List<TaskModel> get tasks => List.unmodifiable(_tasks);

  DbManager() {
    _dbHelper = DatabaseHelper();
    _getAllTaks();
  }

  void _getAllTaks() async {
    _tasks = await _dbHelper.getTasks();
    notifyListeners();
  }

  Future<void> addTask(TaskModel task) async {
    await _dbHelper.insertTask(task);
    _getAllTaks();
  }

  Future<TaskModel> getTaskById(String id) async {
    return await _dbHelper.getTaskById(id);
  }

  Future<void> upadateTask(TaskModel task) async {
    final isSuccess = await _dbHelper.updateTask(task);
    if (isSuccess) _getAllTaks();
  }

  Future<void> deleteTask(String id) async {
    final isSuccess = await _dbHelper.deleteTask(id);
    if (isSuccess) _getAllTaks();
  }
}
