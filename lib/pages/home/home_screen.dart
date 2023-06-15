import 'package:flutter/material.dart';
import 'package:todoist/constants/color_constants.dart';
import 'package:todoist/routes/router_constants.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, RouterName.newTaskRoute);
        },
        child: const Icon(Icons.add, color: Colors.white, size: 24),
      ),
      body: SafeArea(
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
                childCount: 20,
                (context, index) {
                  return Dismissible(
                    key: Key(index.toString()),
                    child: ListTile(
                      tileColor: Colors.white,
                      leading: Checkbox(
                        value: true,
                        onChanged: (value) {},
                      ),
                      title: Text('Item ${1 + index}'),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
