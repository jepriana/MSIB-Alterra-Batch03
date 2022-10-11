import 'package:flutter/material.dart';
import 'package:flutter_task_managtement/models/task_model.dart';
import 'package:nanoid/nanoid.dart';

class TaskItemScreen extends StatefulWidget {
  final Function(TaskModel) onCreate;
  const TaskItemScreen({
    super.key,
    required this.onCreate,
  });

  @override
  State<TaskItemScreen> createState() => _TaskItemScreenState();
}

class _TaskItemScreenState extends State<TaskItemScreen> {
  final TextEditingController _ctrlTask = TextEditingController();
  String _taskName = '';

  @override
  void initState() {
    _ctrlTask.addListener(() {
      setState(() {
        _taskName = _ctrlTask.text;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _ctrlTask.dispose();
    super.dispose();
  }

  Widget _buildTaskNameField(BuildContext context) {
    return Column(
      children: [
        const Text('Task Title'),
        const SizedBox(
          height: 8,
        ),
        TextField(
          controller: _ctrlTask,
          cursorColor: Colors.black,
        )
      ],
    );
  }

  Widget _buildButton(BuildContext context) {
    return ElevatedButton.icon(
      icon: const Icon(Icons.add_task),
      onPressed: () {
        final task = TaskModel(id: nanoid(10), taskName: _taskName);
        widget.onCreate(task);
      },
      label: const Text('Create Task'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Task'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildTaskNameField(context),
            const SizedBox(
              height: 8,
            ),
            _buildButton(context),
          ],
        ),
      ),
    );
  }
}
