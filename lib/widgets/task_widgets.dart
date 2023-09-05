import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist/models/task.dart';

import '../screens/task_screen.dart';

class TaskTile extends StatelessWidget {
  TaskTile(
      {required this.isChecked,
      required this.taskTitle,
      required this.checkboxCallback,
      required this.onLongPressCallback});
  final bool isChecked;
  final String taskTitle;
  final void Function(bool?)? checkboxCallback;
  final void Function() onLongPressCallback;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        taskTitle,
        style: TextStyle(
            decoration: isChecked ? TextDecoration.lineThrough : null),
      ),
      trailing: Checkbox(
        value: isChecked,
        onChanged: checkboxCallback,
      ),
      onLongPress: onLongPressCallback,
    );
  }
}

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<Data>(
      builder: (BuildContext context, data, Widget? child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            final task = data.currentTasksList[index];
            return TaskTile(
              isChecked: task.isDone,
              taskTitle: task.name,
              checkboxCallback: (checkboxState) {
                data.updateTask(task);
              },
              onLongPressCallback: () {
                data.deleteTask(task);
              },
            );
          },
          itemCount: data.taskCount,
        );
      },
    );
  }
}
