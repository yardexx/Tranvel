import 'package:flutter/material.dart';

class IconText extends StatelessWidget {
  const IconText({Key? key, required this.text, required this.icon})
      : super(key: key);

  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return Row(
      children: [
        Icon(icon),
        const SizedBox(width: 4.0),
        Text(
          text,
          style: theme.textTheme.subtitle2,
        ),
      ],
    );
  }
}