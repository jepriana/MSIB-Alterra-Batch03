import 'package:flutter/foundation.dart';
import 'package:flutter_task_managtement/models/task_model.dart';

class TaskManager extends ChangeNotifier {
  final _tasks = <TaskModel>[];

  List<TaskModel> get tasks => List.unmodifiable(_tasks);

  void addTask(TaskModel task) {
    _tasks.add(task);
    notifyListeners();
  }

  void deleteTask(int index) {
    _tasks.removeAt(index);
    notifyListeners();
  }
}
