import 'package:flutter/material.dart';

class IncidentCard extends StatelessWidget {
  const IncidentCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      child: Theme(
        data: theme.copyWith(
          dividerColor: Colors.transparent,
        ),
        child: ExpansionTile(
          tilePadding: const EdgeInsets.all(8),
          trailing: const Padding(
            padding: EdgeInsets.only(right: 8),
            child: Icon(
              Icons.check_circle_outline,
              size: 32,
              color: Colors.green,
            ),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Text(
              'Train traffic is smooth.',
              style: theme.textTheme.subtitle1,
            ),
          ),
          title: Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Text(
              '0 major incidents',
              style: theme.textTheme.headline5?.copyWith(
                color: Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          children: [
            Theme(data: theme, child: const Divider()),
            const SizedBox(
              height: 150,
              width: double.infinity,
            )
          ],
        ),
      ),
    );
  }
}
