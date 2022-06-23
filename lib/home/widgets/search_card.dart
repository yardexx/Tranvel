import 'package:flutter/material.dart';
import 'package:trainvel/search/search.dart';

class SearchCard extends StatelessWidget {
  const SearchCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        onPrimary: Theme.of(context).colorScheme.onPrimary,
        primary: Theme.of(context).colorScheme.primary,
      ).copyWith(
        elevation: ButtonStyleButton.allOrNull(0),
      ),
      onPressed: () => Navigator.of(context).push(SearchPage.route()),
      icon: const Icon(
        Icons.search,
        size: 32,
        color: Colors.white,
      ),
      label: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Find a train',
                  style:
                      theme.textTheme.headline5?.copyWith(color: Colors.white),
                ),
                Text(
                  'We love trains, right?',
                  style:
                      theme.textTheme.subtitle1?.copyWith(color: Colors.white),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
