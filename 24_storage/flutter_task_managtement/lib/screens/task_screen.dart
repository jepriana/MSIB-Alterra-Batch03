import 'package:flutter/material.dart';
import 'package:flutter_task_managtement/components/profile_sheet.dart';
import 'package:flutter_task_managtement/providers/task_manager.dart';
import 'package:flutter_task_managtement/screens/empty_task_screen.dart';
import 'package:flutter_task_managtement/screens/task_item_screen.dart';
import 'package:flutter_task_managtement/screens/task_list_screen.dart';
import 'package:provider/provider.dart';

class TaskScreen extends StatefulWidget {
  static const routeName = '/task';
  const TaskScreen({super.key});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

Widget _buildTaskScreen(BuildContext context) {
  return Consumer<TaskManager>(
    builder: (context, manager, child) {
      if (manager.tasks.isNotEmpty) {
        return TaskListScreen(manager: manager);
      } else {
        return const EmptyTaskScreen();
      }
    },
  );
}

class _TaskScreenState extends State<TaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task Management'),
        actions: [
          IconButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(32),
                  ),
                ),
                builder: (context) {
                  return const ProfileSheet();
                },
              );
            },
            icon: const Icon(
              Icons.account_circle_rounded,
            ),
          ),
        ],
      ),
      body: _buildTaskScreen(context),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final manager = Provider.of<TaskManager>(context, listen: false);
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return TaskItemScreen(onCreate: (task) {
                  manager.addTask(task);
                  Navigator.pop(context);
                });
              },
            ),
          );
        },
        child: const Icon(Icons.add_task),
      ),
    );
  }
}
