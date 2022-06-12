import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TripHistoryCard extends StatelessWidget {
  const TripHistoryCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Last rides',
              style: theme.textTheme.headline5,
            ),
            ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 3,
              shrinkWrap: true,
              itemBuilder: (context, _) {
                return ListTile(
                  onTap: () => debugPrint('ListTile tapped.'),
                  title: const Text('Brno - Bratislava'),
                  subtitle: Text(
                    DateFormat('dd.MM.yyyy').format(DateTime.now()),
                  ),
                  trailing: const Chip(
                    label: Text('R606'),
                    avatar: CircleAvatar(
                      child: Text('R'),
                    ),
                  ),
                );
              },
              separatorBuilder: (_, __) => const Divider(),
            ),
          ],
        ),
      ),
    );
  }
}
