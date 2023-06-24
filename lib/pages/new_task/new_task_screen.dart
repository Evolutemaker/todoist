import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoist/constants/constants.dart';
import 'package:todoist/models/task_model/task_model.dart';
import 'package:todoist/provider/date/date_provider.dart';
import 'package:todoist/provider/priority/priority_provider.dart';
import 'package:todoist/provider/status/status_provider.dart';
import 'package:todoist/provider/task_text/task_text_provider.dart';
import 'package:todoist/provider/theme/theme_provider.dart';
import 'package:todoist/widgets/appbars/new_task_appbar.dart';
import 'package:todoist/widgets/buttons/delete_button.dart';
import 'package:todoist/widgets/custom_textformfield.dart';
import 'package:todoist/widgets/due_date_layout.dart';
import 'package:todoist/widgets/priority_layout.dart';

class NewTaskScreen extends StatefulWidget {
  const NewTaskScreen({super.key, this.taskModel});

  final TaskModel? taskModel;

  @override
  State<NewTaskScreen> createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final ScrollController _scrollController = ScrollController();
  bool _showShadow = false;

  @override
  Widget build(BuildContext context) {
    final colorProvider = context.watch<ThemeProvider>();

    if (widget.taskModel != null) {
      context.read<TaskTextProvider>().setTaskText = widget.taskModel!.text;

      context.read<PriorityProvider>().setTaskPriority =
          widget.taskModel!.importance;

      context.read<DateProvider>().setDate =
          getDateTimeFromTimestamp(widget.taskModel!.deadline);

      context.read<StatusProvider>().setTaskStatus = widget.taskModel!.done;


      // TaskModel newTask = TaskModel(
      //         id: getUniqueTaskId(
      //             text: taskText, importance: priority, createdAt: watchDateProvider.taskCreationTime),
      //         color: colorProvider.apiColor,
      //         created_at: watchDateProvider.taskCreationTime,
      //         changed_at: watchDateProvider.taskChangedTime,
      //         last_updated_by: 'test',
      //       );
    }

    _scrollController.addListener(() {
      final shouldShowShadow = _scrollController.offset > 0;
      if (shouldShowShadow != _showShadow) {
        setState(() {
          _showShadow = shouldShowShadow;
        });
      }
    });

    return Scaffold(
      backgroundColor: colorProvider.backPrimary,
      appBar: NewTaskAppBar(showShadow: _showShadow),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        controller: _scrollController,
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomTextFormField(),
              const PriorityLayout(),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Divider(),
              ),
              const DueDateLayout(),
              const Divider(),
              DeleteButton(
                onPressed: () {
                  //TODO: Delete task logic
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
