import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/Tasks.dart';
import '../models/task.dart';
import 'add_task_screen.dart';
import 'manage_tasks_screen.dart';

class TaskListScreen extends StatelessWidget {
  // Example list of tasks
  final List<Tasks> tasks = [
    Tasks(taskId: 1, taskTitle: "Implement User Authentication", taskStatus: "Completed", taskDueDate: "2024-11-30"),
    Tasks(taskId: 2, taskTitle: "Fix Bug in Login Page", taskStatus: "Pending", taskDueDate: "2024-12-05"),
    Tasks(taskId: 3, taskTitle: "Write Unit Tests for API Endpoints", taskStatus: "In Progress", taskDueDate: "2024-12-10"),
    Tasks(taskId: 4, taskTitle: "Refactor Legacy Code in Authentication", taskStatus: "Pending", taskDueDate: "2024-02-10"),
    Tasks(taskId: 5, taskTitle: "Code Review for Feature X", taskStatus: "In Progress", taskDueDate: "2024-11-11"),
    Tasks(taskId: 6, taskTitle: "Set up CI/CD Pipeline", taskStatus: "Completed", taskDueDate: "2024-01-01"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home'),automaticallyImplyLeading: false,),
      body: Column(
        children: [
          // Task list
          Expanded(
            child: ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                final task = tasks[index];
                return ElevatedCard(task: task);
              },
            ),
          ),

          // Buttons for Add Task and Manage Task
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AddTaskScreen()),
                    );
                  },
                  child: Text('Add Task'),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white, backgroundColor: Colors.purple, // White text color
                    )
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ManageTasksScreen()),
                    );
                  },
                  child: Text('Manage Task'),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white, backgroundColor: Colors.purple, // White text color
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


class ElevatedCard extends StatelessWidget {
  final Tasks task;
  const ElevatedCard({required this.task});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.all(8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(task.taskTitle, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black)),
                SizedBox(height: 5),
                Text(task.taskDueDate, style: TextStyle(color: Colors.grey)),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  task.taskStatus,
                  style: TextStyle(
                    color: task.taskStatus == "Completed" ? Colors.green : task.taskStatus == "In Progress" ? Colors.orange : Colors.red,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}