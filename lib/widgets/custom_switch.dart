import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoist/constants/color_constants.dart';
import 'package:todoist/constants/constants.dart';
import 'package:todoist/provider/date/date_provider.dart';
import 'package:todoist/provider/switch/switch_provider.dart';

class CustomSwitch extends StatelessWidget {
  const CustomSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    final isSwitch = context.watch<SwitchProvider>().isSwitch;
    final readSwitchProvider = context.read<SwitchProvider>();
    final readDateProvider = context.read<DateProvider>();
    final selectedDate = context.watch<DateProvider>().selectedDate;

    return Switch(
      value: isSwitch,
      activeColor: ColorConstants.lightBlue,
      activeTrackColor: ColorConstants.lightBlue.withOpacity(0.3),
      inactiveTrackColor: ColorConstants.lightSupportOverlay,
      inactiveThumbColor: ColorConstants.lightBackElevated,
      onChanged: (value) async {
        readSwitchProvider.setSwitch = value;

        if (isSwitch) {
          readDateProvider.setDate = await targetDate(
            context,
            pastDate: selectedDate,
          );
        } else {
          readDateProvider.setDate = null;
        }
      },
    );
  }
}
