import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist/models/task.dart';
import 'task_screen.dart';

class AddTaskScreen extends StatelessWidget {
  // final void Function() addCallback;
  // final void Function(String) addText;
  // AddTaskScreen({required this.addCallback, required this.addText});

  late String newText;

  @override
  Widget build(context) {
    return Consumer<Data>(
      builder: (BuildContext context, data, Widget? child) {
        return Container(
          color: Color(0xFF757575),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextField(
                    onChanged: (newValue) {
                      newText = newValue;
                    },
                    //    autofocus: true,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      hintText: 'Add Task',
                      hintStyle: TextStyle(
                          color: Colors.lightBlueAccent, fontSize: 19),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.lightBlueAccent,
                          width: 4,
                        ),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.lightBlueAccent,
                          width: 4,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  GestureDetector(
                    onTap: () {
                      data.addTask(newText);
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: double.infinity,
                      color: Colors.lightBlueAccent,
                      child: Padding(
                        padding: EdgeInsets.all(18.0),
                        child: Text(
                          'Add',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
