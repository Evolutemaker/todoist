import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoist/constants/font_constants.dart';
import 'package:todoist/provider/theme/theme_provider.dart';

class SaveButton extends StatelessWidget {
  const SaveButton({super.key, required this.onPressed});

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    final colorProvider = context.watch<ThemeProvider>();
    
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: TextButton(
        onPressed: onPressed,
        child: TextWidget(
          text: 'СОХРАНИТЬ',
          style: FontConstants.button,
          color: colorProvider.blue,
        ),
      ),
    );
  }
}
