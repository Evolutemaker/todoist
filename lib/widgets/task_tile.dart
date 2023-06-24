import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoist/constants/constants.dart';
import 'package:todoist/constants/enums.dart';
import 'package:todoist/constants/font_constants.dart';
import 'package:todoist/models/task_model/task_model.dart';
import 'package:todoist/provider/theme/theme_provider.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({
    super.key,
    required this.task,
    required this.onChanged,
    required this.onTaskEdit,
  });

  final TaskModel task;
  final void Function(bool?)? onChanged;
  final void Function()? onTaskEdit;

  @override
  Widget build(BuildContext context) {
    final colorProvider = context.watch<ThemeProvider>();
    Color? fillColor;

    switch (task.importance) {
      case TaskPriority.important:
        if (task.done) {
          fillColor = null;
        } else {
          fillColor = colorProvider.red;
        }
        break;
      default:
        if (task.done) {
          fillColor = null;
        }
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Checkbox(
          value: task.done,
          onChanged: onChanged,
          activeColor: colorProvider.green,
          fillColor: MaterialStateProperty.all(fillColor),
        ),
        const SizedBox(width: 12),
        task.importance == TaskPriority.basic
            ? const SizedBox()
            : Container(
                margin: const EdgeInsets.only(right: 3),
                padding: const EdgeInsets.only(top: 14),
                child: task.importance == TaskPriority.important
                    ? Text(
                        '\u203C\uFE0F',
                        style: TextStyle(
                          color: colorProvider.red,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          fontFamily: 'Roboto',
                        ),
                      )
                    : Icon(
                        Icons.arrow_downward_rounded,
                        color: colorProvider.gray,
                      ),
              ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(
              top: task.importance == TaskPriority.basic ? 12 : 14,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWidget(
                  text: task.text,
                  decoration: task.done
                      ? TextDecoration.lineThrough
                      : null,
                  color: task.done
                      ? colorProvider.labelTertiary
                      : colorProvider.labelPrimary,
                  style: FontConstants.body,
                ),
                task.deadline == null
                    ? const SizedBox()
                    : Container(
                        margin: const EdgeInsets.only(top: 4),
                        child: TextWidget(
                          text: formatSelectedDate(task.deadline!),
                          color: colorProvider.labelTertiary,
                          style: FontConstants.body,
                        ),
                      ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 12),
        IconButton(
          onPressed: onTaskEdit,
          splashRadius: 24,
          icon: Icon(
            Icons.info_outline,
            size: 24,
            color: colorProvider.labelTertiary,
          ),
        ),
      ],
    );
  }
}
