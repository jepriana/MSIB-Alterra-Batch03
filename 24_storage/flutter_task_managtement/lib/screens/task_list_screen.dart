import 'package:flutter/material.dart';
import 'package:flutter_task_managtement/components/task_item_card.dart';
import 'package:flutter_task_managtement/providers/db_manager.dart';
import 'package:flutter_task_managtement/providers/task_manager.dart';

class TaskListScreen extends StatelessWidget {
  final DbManager manager;
  const TaskListScreen({super.key, required this.manager});

  @override
  Widget build(BuildContext context) {
    final taskItems = manager.tasks;
    return Padding(
      padding: const EdgeInsets.all(16),
      child: ListView.separated(
        itemBuilder: (context, index) {
          final task = taskItems[index];
          return TaskItemCard(
            key: Key(task.id),
            task: task,
            onPressed: () {
              manager.deleteTask(task.id);
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('${task.taskName} deleted.'),
                ),
              );
            },
          );
        },
        separatorBuilder: (context, index) => const SizedBox(
          height: 16,
        ),
        itemCount: taskItems.length,
      ),
    );
  }
}
