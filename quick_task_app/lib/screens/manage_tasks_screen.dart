import 'package:flutter/material.dart';

import '../models/task.dart';

class ManageTasksScreen extends StatefulWidget {
  @override
  _ManageTasksScreenState createState() => _ManageTasksScreenState();
}

class _ManageTasksScreenState extends State<ManageTasksScreen> {
  List<Task> tasks = [
    Task(taskId: '1', taskTitle: 'Task 1', taskStatus: false),
    Task(taskId: '2', taskTitle: 'Task 2', taskStatus: true),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Manage Tasks')),
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          final task = tasks[index];
          return ListTile(
            title: Text(task.taskTitle),
            subtitle: Text('Due: ${task.taskId}'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Switch(
                  value: task.taskStatus,
                  onChanged: (value) {
                    setState(() {
                      task.taskStatus = value;
                    });
                    print('Task toggled: ${task.toString()}');
                  },
                ),
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    setState(() {
                      tasks.removeAt(index);
                    });
                    print('Task deleted: ${task.toString()}');
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
