import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoist/constants/enums.dart';
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
  List<TaskModel> tasksList = [
    TaskModel(
      id: 'id',
      text: 'Something text',
      importance: TaskPriority.basic,
      deadline: 34,
      done: false,
      color: 'df',
      created_at: 34,
      changed_at: 3434,
      last_updated_by: 'last_updated_by',
    ),
  ];

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
              delegate: SliverChildBuilderDelegate((context, index) {
                return Container(
                  decoration: BoxDecoration(
                    color: colorProvider.backSecondary,
                    boxShadow: colorProvider.shadow,
                  ),
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    children: List.generate(
                      tasksList.length,
                      (index) {
                        return Dismissible(
                          key: UniqueKey(),
                          background: Container(
                            alignment: Alignment.centerLeft,
                            color: colorProvider.green,
                            child: const Padding(
                              padding: EdgeInsets.only(left: 20),
                              child: Icon(
                                Icons.check,
                                color: Colors.white,
                                size: 24,
                              ),
                            ),
                          ),
                          secondaryBackground: Container(
                            alignment: Alignment.centerRight,
                            color: colorProvider.red,
                            child: const Padding(
                              padding: EdgeInsets.only(right: 20),
                              child: Icon(
                                Icons.delete,
                                color: Colors.white,
                                size: 24,
                              ),
                            ),
                          ),
                          child: TaskTile(
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
                          ),
                        );
                      },
                    ),
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
