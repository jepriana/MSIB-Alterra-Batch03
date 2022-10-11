class TaskModel {
  late String id;
  late String taskName;

  TaskModel({required this.id, required this.taskName});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'taskName': taskName,
    };
  }

  TaskModel.fromMap(Map<String, dynamic> map) {
    id = map['id'].toString();
    taskName = map['taskName'].toString();
  }
}
