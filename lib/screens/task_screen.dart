import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist/widgets/task_widgets.dart';
import '../models/task.dart';
import 'add_task_screen.dart';
import 'package:collection/collection.dart';

class Data extends ChangeNotifier {
  String newTask = '';
  List<Task> _currentTasksList = [];
  UnmodifiableListView<Task> get currentTasksList {
    return UnmodifiableListView(_currentTasksList);
  }

  void taskText(String text) {
    newTask = text;
    notifyListeners();
  }

  void addTask(newText) {
    _currentTasksList.add(Task(name: newText));
    notifyListeners();
  }

  int get taskCount {
    return _currentTasksList.length;
  }

  void updateTask(Task task) {
    task.toggleDone();
    notifyListeners();
  }

  void deleteTask(Task task) {
    _currentTasksList.remove(task);
  }
}

class TasksScreen extends StatelessWidget {
  @override
  Widget build(context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) => AddTaskScreen(
                //  addCallback: addTask,
                //  addText: taskText,
                ),
          );
        },
        backgroundColor: Colors.lightBlueAccent,
        child: Icon(Icons.add),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(top: 60, left: 30, right: 30, bottom: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 30,
                  child: Icon(
                    Icons.list,
                    size: 30,
                    color: Colors.lightBlueAccent,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Todoey',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 50,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  '${Provider.of<Data>(context).taskCount} tasks',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              height: 300,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: TasksList(
                  //  tasks: Provider.of<Data>(context).currentTasksList,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
