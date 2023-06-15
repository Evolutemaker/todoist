import 'package:flutter/material.dart';
import 'package:todoist/constants/color_constants.dart';
import 'package:todoist/constants/constants.dart';
import 'package:todoist/constants/enums.dart';

class NewTaskScreen extends StatefulWidget {
  const NewTaskScreen({super.key});

  @override
  State<NewTaskScreen> createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {
  bool isSwitch = false;

  TaskPriority priority = TaskPriority.values.first;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.close,
            size: 24,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: Text(
              'СОХРАНИТЬ',
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Важность',
                            style: ThemeData().textTheme.bodyMedium,
                          ),
                          const SizedBox(height: 4),
                          DropdownButtonHideUnderline(
                            child: DropdownButton<TaskPriority>(
                              value: priority,
                              style: Theme.of(context).textTheme.bodySmall!.copyWith(color: ColorConstants.lightLabelTertiary),
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
                                  child: Text(
                                    entry.value,
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Divider(),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Сделать до',
                              style: ThemeData().textTheme.bodyMedium,
                            ),
                            const SizedBox(height: 4),
                            GestureDetector(
                              onTap: () {},
                              child: Text(
                                '2 июнь',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(color: ColorConstants.lightBlue),
                              ),
                            ),
                          ],
                        ),
                        Switch(
                          value: isSwitch,
                          activeColor: ColorConstants.lightBlue,
                          activeTrackColor:
                              ColorConstants.lightBlue.withOpacity(0.3),
                          inactiveTrackColor:
                              ColorConstants.lightSupportOverlay,
                          inactiveThumbColor: ColorConstants.lightBackElevated,
                          onChanged: (value) {
                            setState(() {
                              isSwitch = value;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  shadowColor: Colors.transparent,
                  foregroundColor: ColorConstants.lightRed,
                  backgroundColor: Colors.transparent,
                  padding: const EdgeInsets.all(8),
                ),
                onPressed: () {},
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.delete,
                      size: 24,
                    ),
                    SizedBox(width: 12),
                    Text(
                      'Удалить',
                      style: ThemeData()
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: ColorConstants.lightRed),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
