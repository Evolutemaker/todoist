import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoist/constants/constants.dart';
import 'package:todoist/constants/font_constants.dart';
import 'package:todoist/provider/date/date_provider.dart';
import 'package:todoist/provider/switch/switch_provider.dart';
import 'package:todoist/provider/theme/theme_provider.dart';
import 'package:todoist/widgets/custom_switch.dart';

class DueDateLayout extends StatelessWidget {
  const DueDateLayout({super.key});

  @override
  Widget build(BuildContext context) {
    final colorProvider = context.watch<ThemeProvider>();
    final isSwitch = context.watch<SwitchProvider>().isSwitch;
    final selectedDate = context.watch<DateProvider>().selectedDate;
    final readDateProvider = context.read<DateProvider>();

    return Container(
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
                      onTap: () async {
                        if (isSwitch) {
                          readDateProvider.setDate = await targetDate(
                            context,
                            pastDate: selectedDate,
                          );
                        } else {
                          readDateProvider.setDate = null;
                        }
                      },
                      child: Container(
                        margin: const EdgeInsets.only(top: 4),
                        child: TextWidget(
                          text: formatSelectedDate(
                            selectedDate?.millisecondsSinceEpoch ??
                                DateTime.now().millisecondsSinceEpoch,
                          ),
                          style: FontConstants.body,
                          color: colorProvider.blue,
                        ),
                      ),
                    )
                  : const SizedBox(),
            ],
          ),
          const CustomSwitch(),
        ],
      ),
    );
  }
}
