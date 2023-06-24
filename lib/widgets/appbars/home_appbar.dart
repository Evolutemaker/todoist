import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoist/constants/font_constants.dart';
import 'package:todoist/provider/theme/theme_provider.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final colorProvider = context.watch<ThemeProvider>();

    return SliverAppBar(
      backgroundColor: colorProvider.backPrimary,
      pinned: true,
      expandedHeight: 130,
      floating: true,
      collapsedHeight: 56,
      elevation: 4,
      leading: const SizedBox(),
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: const EdgeInsetsDirectional.only(bottom: 16, start: 0),
        expandedTitleScale: 32 / 20,
        title: TextWidget(
          text: 'Мои дела',
          color: colorProvider.labelPrimary,
          style: FontConstants.title,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {
            //TODO: Enable/Disable done tasks
          },
          iconSize: 24,
          splashRadius: 24,
          color: colorProvider.blue,
          icon: const Icon(Icons.remove_red_eye_rounded),
        ),
      ],
    );
  }
}