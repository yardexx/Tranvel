import 'package:flutter/material.dart';

class IconText extends StatelessWidget {
  const IconText({super.key, required this.text, required this.icon});

  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      children: [
        Icon(icon),
        const SizedBox(width: 4),
        Text(
          text,
          style: theme.textTheme.subtitle2,
        ),
      ],
    );
  }
}
