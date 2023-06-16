import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoist/constants/color_constants.dart';
import 'package:todoist/constants/font_constants.dart';
import 'package:todoist/provider/theme/theme_provider.dart';

class DeleteButton extends StatelessWidget {
  const DeleteButton({
    super.key,
    required this.isActive,
    required this.onPressed,
  });

  final bool isActive;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    final colorProvider = context.watch<ThemeProvider>();

    return isActive
        ? Container(
            padding: const EdgeInsets.only(left: 8, top: 8),
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
                  const Icon(
                    Icons.delete,
                    size: 24,
                  ),
                  const SizedBox(width: 12),
                  TextWidget(
                    text: 'Удалить',
                    style: FontConstants.body,
                    color: colorProvider.red,
                  ),
                ],
              ),
            ),
          )
        : Container(
            padding: const EdgeInsets.fromLTRB(16, 20, 16, 16),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.delete,
                  size: 24,
                  color: colorProvider.labelDisable,
                ),
                const SizedBox(width: 12),
                TextWidget(
                  text: 'Удалить',
                  style: FontConstants.body,
                  color: colorProvider.labelDisable,
                ),
              ],
            ),
          );
  }
}
