import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist/screens/task_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Data(),
      child: MaterialApp(
        home: TasksScreen(),
      ),
    );
  }
}
