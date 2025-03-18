import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist/data/local/task_dao.dart';
import 'package:todolist/repository/task_repository.dart';
import 'package:todolist/view/screens/home_screen.dart';
import 'package:todolist/viewmodel/task_viewmodel.dart';

void main() {
  final taskDao = TaskDao();
  final repository = TaskRepository(taskDao: taskDao);
  runApp(
    ChangeNotifierProvider(
      create: (_) => TaskViewModel(repository: repository),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
        title: 'todo list',
        debugShowCheckedModeBanner: false,
        home: HomeScreen());
  }
}
