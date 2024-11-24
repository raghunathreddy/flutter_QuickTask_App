import 'package:flutter/material.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

class AddTaskScreen extends StatefulWidget {
  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final TextEditingController _taskIdController = TextEditingController();
  final TextEditingController _taskTitleController = TextEditingController();
  final TextEditingController _dueDateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Task')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _taskIdController,
              decoration: InputDecoration(labelText: 'Task ID'),
            ),
            TextField(
              controller: _taskTitleController,
              decoration: InputDecoration(labelText: 'Task Title'),
            ),
            TextField(
              controller: _dueDateController,
              decoration: InputDecoration(labelText: 'Due Date'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _addTask,
              child: Text('Add Task'),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, backgroundColor: Colors.purple, // White text color
                )
            ),
          ],
        ),
      ),
    );
  }

/*  void _addTask() {
    final String taskId = _taskIdController.text;
    final String taskTitle = _taskTitleController.text;
    final String dueDate = _dueDateController.text;

    if (taskId.isNotEmpty && taskTitle.isNotEmpty && dueDate.isNotEmpty) {
      // Print task details (For now we are just printing the task)
      print('Task Added: ID: $taskId, Title: $taskTitle, Due Date: $dueDate');


      Navigator.pop(context); // Go back to HomeScreen after adding the task
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Please fill all fields')));
    }
  }*/

Future<void> _addTask() async {
    final String taskId = _taskIdController.text;
    final String taskTitle = _taskTitleController.text;
    final String dueDate = _dueDateController.text;

    if (taskId.isNotEmpty && taskTitle.isNotEmpty && dueDate.isNotEmpty) {
      // Create a new Parse object for Task
      final task = ParseObject('Task') // 'Task' is the class name in your Back4App database
        ..set('taskId', taskId)
        ..set('taskTitle', taskTitle)
        ..set('dueDate', dueDate);

      // Save the task to Back4App
      final ParseResponse response = await task.save();

      if (response.success) {
        // Task saved successfully
        print('Task Added: ID: $taskId, Title: $taskTitle, Due Date: $dueDate');
        Navigator.pop(context); // Go back to HomeScreen after adding the task
      } else {
        // Handle errors if the save fails
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Failed to add task')));
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Please fill all fields')));
    }
  }
}


