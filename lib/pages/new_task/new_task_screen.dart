import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:todoist/blocs/task/task_bloc.dart';
import 'package:todoist/constants/color_constants.dart';
import 'package:todoist/constants/constants.dart';
import 'package:todoist/constants/enums.dart';
import 'package:todoist/constants/font_constants.dart';
import 'package:todoist/models/task/task_model.dart';
import 'package:todoist/provider/theme/theme_provider.dart';
import 'package:todoist/widgets/buttons/delete_button.dart';

class NewTaskScreen extends StatefulWidget {
  const NewTaskScreen({super.key});

  @override
  State<NewTaskScreen> createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {
  final ScrollController _scrollController = ScrollController();

  final TextEditingController _taskTextController = TextEditingController();

  bool _showShadow = false;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool isSwitch = false;

  bool isDeleteActive = false;

  TaskPriority priority = TaskPriority.no;

  DateTime? selectedDate;

  @override
  Widget build(BuildContext context) {
    final colorProvider = context.watch<ThemeProvider>();

    _scrollController.addListener(() {
      setState(() {
        _scrollController.offset > 0 ? _showShadow = true : _showShadow = false;
      });
    });

    return BlocListener<TaskBloc, TaskState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      child: Scaffold(
        backgroundColor: colorProvider.backPrimary,
        appBar: AppBar(
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
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: TextButton(
                onPressed: () {
                  TaskModel newTask = TaskModel(
                    text: _taskTextController.text,
                    priority: priority,
                    date: selectedDate,
                  );

                  context.read<TaskBloc>().add(CreateTask(task: newTask));

                  Navigator.pop(context);
                },
                child: TextWidget(
                  text: 'СОХРАНИТЬ',
                  style: FontConstants.button,
                  color: colorProvider.blue,
                ),
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          controller: _scrollController,
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(16, 8, 16, 12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.12),
                        offset: const Offset(0, 2),
                        blurRadius: 2,
                        spreadRadius: 0,
                      ),
                      BoxShadow(
                        color: Colors.black.withOpacity(0.06),
                        offset: const Offset(0, 2),
                        blurRadius: 2.0,
                        spreadRadius: 0,
                      ),
                    ],
                  ),
                  child: TextFormField(
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Пожалуйста, введите вашу задачу';
                      }
                      return null;
                    },
                    controller: _taskTextController,
                    // onChanged: (value) {
                    //   //value.length
                    // },
                    style: FontConstants.body.copyWith(
                      color: colorProvider.labelPrimary,
                    ),
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      hintText: 'Что надо сделать...',
                      hintStyle: FontConstants.body.copyWith(
                        color: colorProvider.labelTertiary,
                      ),
                      fillColor: Colors.white,
                      filled: true,
                      counterText: '',
                      contentPadding: const EdgeInsets.all(16),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
                Container(
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
                                setState(() {
                                  priority = chosenPriority ?? TaskPriority.no;
                                });
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
                                    color: entry.key == TaskPriority.high
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
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Divider(),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(16, 16, 8, 16),
                  margin: const EdgeInsets.only(bottom: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextWidget(
                            text: 'Сделать до',
                            style: FontConstants.body,
                            color: colorProvider.labelPrimary,
                          ),
                          isSwitch
                              ? GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    margin: const EdgeInsets.only(top: 4),
                                    child: TextWidget(
                                      text: '2 июня 2021',
                                      style: FontConstants.body,
                                      color: colorProvider.blue,
                                    ),
                                  ),
                                )
                              : const SizedBox(),
                        ],
                      ),
                      Switch(
                        value: isSwitch,
                        activeColor: ColorConstants.lightBlue,
                        activeTrackColor:
                            ColorConstants.lightBlue.withOpacity(0.3),
                        inactiveTrackColor: ColorConstants.lightSupportOverlay,
                        inactiveThumbColor: ColorConstants.lightBackElevated,
                        onChanged: (value) async {
                          setState(() {
                            isSwitch = value;
                          });

                          if (isSwitch) {
                            selectedDate = await targetDate(context);
                          } else {
                            selectedDate = null;
                          }
                        },
                      ),
                    ],
                  ),
                ),
                const Divider(),
                DeleteButton(
                  isActive: isSwitch,
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
