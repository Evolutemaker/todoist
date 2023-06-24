import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoist/constants/constants.dart';
import 'package:todoist/constants/enums.dart';
import 'package:todoist/constants/font_constants.dart';
import 'package:todoist/provider/priority/priority_provider.dart';
import 'package:todoist/provider/theme/theme_provider.dart';

class PriorityLayout extends StatelessWidget {
  const PriorityLayout({super.key});

  @override
  Widget build(BuildContext context) {
    final colorProvider = context.watch<ThemeProvider>();
    final priority = context.watch<PriorityProvider>().taskPriority;
    final readPriorityProvider = context.read<PriorityProvider>();

    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 16,
        horizontal: 16,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextWidget(
                text: 'Важность',
                style: FontConstants.body,
                color: colorProvider.labelPrimary,
              ),
              const SizedBox(height: 4),
              DropdownButtonHideUnderline(
                child: DropdownButton<TaskPriority>(
                  value: priority,
                  style: FontConstants.subhead.copyWith(
                    color: colorProvider.labelTertiary,
                  ),
                  onChanged: (chosenPriority) {
                    readPriorityProvider.setTaskPriority =
                        chosenPriority ?? TaskPriority.basic;
                  },
                  isDense: true,
                  alignment: Alignment.centerLeft,
                  items: priorityTitles.entries
                      .map<DropdownMenuItem<TaskPriority>>((entry) {
                    return DropdownMenuItem<TaskPriority>(
                      value: entry.key,
                      child: TextWidget(
                        text: entry.value,
                        style: FontConstants.body,
                        color: entry.key == TaskPriority.important
                            ? colorProvider.red
                            : colorProvider.labelPrimary,
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
