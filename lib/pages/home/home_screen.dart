import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoist/models/task_model/task_model.dart';
import 'package:todoist/provider/theme/theme_provider.dart';
import 'package:todoist/routes/router_constants.dart';
import 'package:todoist/widgets/appbars/home_appbar.dart';
import 'package:todoist/widgets/task_tile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<TaskModel> tasksList = [];

  @override
  Widget build(BuildContext context) {    
    final colorProvider = context.watch<ThemeProvider>();

    return Scaffold(
      backgroundColor: colorProvider.backPrimary,
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Navigator.pushNamed(context, RouterName.newTaskRoute);
        },
        child: const Icon(Icons.add, color: Colors.white, size: 24),
      ),
      body: SafeArea(
        top: false,
        child: CustomScrollView(
          slivers: [
            const HomeAppBar(),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                childCount: 1,
                (context, index) {
                  return TaskTile(
                    task: TaskModel(
                      id: tasksList[index].id,
                      text: tasksList[index].id,
                      importance: tasksList[index].importance,
                      deadline: tasksList[index].deadline,
                      done: tasksList[index].done,
                      color: tasksList[index].color,
                      created_at: tasksList[index].created_at,
                      changed_at: tasksList[index].changed_at,
                      last_updated_by: tasksList[index].last_updated_by,
                    ),
                    onChanged: (value) {},
                    onTaskEdit: () {},
                  );
                  // return Dismissible(
                  //   key: Key(index.toString()),
                  //   child: ListTile(
                  //     tileColor: Colors.white,
                  //     leading: Checkbox(
                  //       value: true,
                  //       onChanged: (value) {},
                  //     ),
                  //     title: Text('${state.tasks[index].text}'),
                  //   ),
                  // );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
