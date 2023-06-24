import 'package:flutter/material.dart';
import 'package:todoist/models/task_model/task_model.dart';
import 'package:todoist/pages/error/error_screen.dart';
import 'package:todoist/pages/home/home_screen.dart';
import 'package:todoist/pages/new_task/new_task_screen.dart';
import 'package:todoist/routes/router_constants.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouterName.homeRoute:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );
      case RouterName.newTaskRoute:
        final args = settings.arguments as TaskModel;
        return MaterialPageRoute(
          builder: (_) =>  NewTaskScreen(taskModel: args),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const ErrorScreen(),
        );
    }
  }
}
