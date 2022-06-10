import 'package:flutter/material.dart';
import 'package:trainvel/search/search.dart';

class SearchCard extends StatelessWidget {
  const SearchCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      color: theme.primaryColor,
      child: InkWell(
        onTap: () => Navigator.of(context).push(SearchPage.route()),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Find a train',
                    style: theme.textTheme.headline5
                        ?.copyWith(color: Colors.white),
                  ),
                  Text(
                    'We love trains, right?',
                    style: theme.textTheme.subtitle1
                        ?.copyWith(color: Colors.white),
                  )
                ],
              ),
              const Icon(
                Icons.search,
                size: 32,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
