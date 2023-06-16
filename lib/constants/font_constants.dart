import 'package:flutter/material.dart';

class FontConstants {
  // Large title
  static const TextStyle largeTitle = TextStyle(
    fontWeight: FontWeight.w500,
    fontFamily: 'Roboto',
    fontSize: 32,
  );

  // Title
  static const TextStyle title = TextStyle(
    fontWeight: FontWeight.w500,
    fontFamily: 'Roboto',
    fontSize: 20,
  );

  // Button
  static const TextStyle button = TextStyle(
    fontWeight: FontWeight.w500,
    fontFamily: 'Roboto',
    fontSize: 14,
  );

  // Body
  static const TextStyle body = TextStyle(
    fontWeight: FontWeight.w400,
    fontFamily: 'Roboto',
    fontSize: 16,
  );

  // Subhead
  static const TextStyle subhead = TextStyle(
    fontWeight: FontWeight.w400,
    fontFamily: 'Roboto',
    fontSize: 14,
  );
}

class TextWidget extends StatelessWidget {
  const TextWidget({
    super.key,
    required this.text,
    required this.color,
    required this.style,
    this.textAlign,
  });
  final Color color;
  final String text;
  final TextStyle style;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: style.copyWith(
        color: color,
      ),
      child: Text(
        text,
        textAlign: textAlign,
      ),
    );
  }
}
