import 'package:flutter/material.dart';

class TrainChip extends StatelessWidget {
  const TrainChip({
    super.key,
    required this.leading,
    required this.trailingText,
  });

  final Widget leading;
  final String trailingText;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
        border: Border.all(width: 2),
      ),
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              radius: 16,
              child: leading,
            ),
            const SizedBox(
              width: 8,
            ),
            Text(
              trailingText,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(
              width: 8,
            )
          ],
        ),
      ),
    );
  }
}
