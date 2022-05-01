import 'package:flutter/material.dart';

class IncidentCard extends StatelessWidget {
  const IncidentCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '0 major incidents',
                  style: theme.textTheme.headline5?.copyWith(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Train traffic is smooth.',
                  style: theme.textTheme.subtitle1,
                )
              ],
            ),
            const Icon(
              Icons.check_circle_outline,
              size: 32,
              color: Colors.green,
            ),
          ],
        ),
      ),
    );
  }
}
