import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoist/blocs/task/task_bloc.dart';
import 'package:todoist/constants/color_constants.dart';
import 'package:todoist/constants/constants.dart';
import 'package:todoist/provider/theme/theme_provider.dart';
import 'package:todoist/routes/router_constants.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colorProvider = context.watch<ThemeProvider>();

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Navigator.pushNamed(context, RouterName.newTaskRoute);
        },
        child: const Icon(Icons.add, color: Colors.white, size: 24),
      ),
      body: BlocBuilder<TaskBloc, TaskState>(
        builder: (context, state) {
          if (state is TaskLoaded) {
            return SafeArea(
              top: false,
              child: CustomScrollView(
                slivers: [
                  SliverAppBar(
                    backgroundColor: ColorConstants.lightBackPrimary,
                    pinned: true,
                    expandedHeight: 130,
                    floating: true,
                    collapsedHeight: 56,
                    elevation: 4,
                    flexibleSpace: FlexibleSpaceBar(
                      title: Text(
                        'Мои дела',
                      ),
                    ),
                  ),
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      childCount: state.tasks.length,
                      (context, index) {
                        return Dismissible(
                          key: Key(index.toString()),
                          child: ListTile(
                            tileColor: Colors.white,
                            leading: Checkbox(
                              value: true,
                              onChanged: (value) {},
                            ),
                            title: Text('${state.tasks[index].text}'),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          } else {
            return Center(
              child: CupertinoActivityIndicator(color: colorProvider.blue),
            );
          }
        },
      ),
    );
  }
}
