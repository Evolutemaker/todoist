import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoist/constants/constants.dart';
import 'package:todoist/models/task_model/task_model.dart';
import 'package:todoist/provider/date/date_provider.dart';
import 'package:todoist/provider/priority/priority_provider.dart';
import 'package:todoist/provider/status/status_provider.dart';
import 'package:todoist/provider/task_text/task_text_provider.dart';
import 'package:todoist/provider/theme/theme_provider.dart';
import 'package:todoist/widgets/buttons/save_button.dart';

class NewTaskAppBar extends StatelessWidget implements PreferredSizeWidget {
  const NewTaskAppBar({
    super.key,
    required bool showShadow,
  }) : _showShadow = showShadow;

  final bool _showShadow;

  @override
  Widget build(BuildContext context) {
    final colorProvider = context.watch<ThemeProvider>();
    final priority = context.watch<PriorityProvider>().taskPriority;
    final taskText = context.watch<TaskTextProvider>().taskText;
    final selectedDate = context.watch<DateProvider>().selectedDate;
    final isComplete = context.watch<StatusProvider>().isComplete;
    final watchDateProvider = context.watch<DateProvider>();

    return AppBar(
      backgroundColor: colorProvider.backPrimary,
      elevation: _showShadow ? 4 : 0,
      leading: Padding(
        padding: const EdgeInsets.only(left: 8),
        child: IconButton(
          icon: Icon(
            Icons.close,
            size: 24,
            color: colorProvider.labelPrimary,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      actions: [
        SaveButton(
          onPressed: () {
            //TODO: Create new task logic

            TaskModel newTask = TaskModel(
              id: getUniqueTaskId(
                  text: taskText, importance: priority, createdAt: watchDateProvider.taskCreationTime),
              text: taskText,
              importance: priority,
              deadline: selectedDate?.millisecondsSinceEpoch,
              done: isComplete,
              color: colorProvider.apiColor,
              created_at: watchDateProvider.taskCreationTime,
              changed_at: watchDateProvider.taskChangedTime,
              last_updated_by: 'test',
            );

            print('ID: ${newTask.id}');
            print('Task: ${newTask.text}');
            print('Priority: ${newTask.importance}');
            print('Due date: ${newTask.deadline}');
            print('Task done: ${newTask.done}');
            print('System color: ${newTask.color}');
            print('Task created time: ${newTask.created_at}');
            print('Task changed time: ${newTask.changed_at}');
            print('Owner id: ${newTask.last_updated_by}');

            //context.read<TaskBloc>().add(CreateTask(task: newTask));

            Navigator.pop(context);
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
