import 'package:flutter/material.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

class TaskListScreen extends StatefulWidget {
  @override
  _TaskListScreenState createState() => _TaskListScreenState();
}

class _TaskListScreenState extends State<TaskListScreen> {
  List<ParseObject> tasks = [];

  @override
  void initState() {
    super.initState();
    _fetchTasks();
  }

  Future<void> _fetchTasks() async {
    final query = QueryBuilder<ParseObject>(ParseObject('Tasks'))
      ..orderByDescending('createdAt'); // You can change the sort order as needed

    final response = await query.query();

    if (response.success) {
      setState(() {
        tasks = response.results as List<ParseObject>;
      });
    } else {
      // Handle error
      print('Error fetching tasks: ${response.error?.message}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home'), automaticallyImplyLeading: false),
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
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.purple,
                  ),
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
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.purple,
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
  final ParseObject task;
  const ElevatedCard({required this.task});

  @override
  Widget build(BuildContext context) {
    // Assuming the task has fields "taskTitle", "taskStatus", and "taskDueDate"
    String taskTitle = task.get<String>('taskTitle') ?? 'No Title';
    String taskStatus = task.get<String>('taskStatus') ?? 'No Status';
    String taskDueDate = task.get<String>('taskDueDate') ?? 'No Due Date';

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
                Text(taskTitle, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black)),
                SizedBox(height: 5),
                Text(taskDueDate, style: TextStyle(color: Colors.grey)),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  taskStatus,
                  style: TextStyle(
                    color: taskStatus == "Completed"
                        ? Colors.green
                        : taskStatus == "In Progress"
                        ? Colors.orange
                        : Colors.red,
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
