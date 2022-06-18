import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../ticket_catalog/bloc/catalog_bloc.dart';

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
            BlocBuilder<CatalogBloc, CatalogState>(
              builder: (context, state) {
                if (state is CatalogError) {
                  return const Center(
                    child: Text('Failed to load history'),
                  );
                }
                if (state is CatalogLoaded) {
                  final trips = state.catalog.tickets;
                  if (trips.isEmpty) {
                    return const Center(
                      child: Text('No recent trips'),
                    );
                  }
                  return ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: trips.length < 3 ? trips.length : 3,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return ListTile(
                        onTap: () => debugPrint('ListTile tapped.'),
                        title: Text(
                          '${trips[index].train.journey.first.name} - '
                          '${trips[index].train.journey.last.name}',
                        ),
                        subtitle: Text(
                          DateFormat('dd.MM.yyyy').format(
                            trips[index].train.journeyDate,
                          ),
                        ),
                        trailing: Chip(
                          label: Text(trips[index].train.number.toString()),
                          avatar: CircleAvatar(
                            child: Text(trips[index].train.category),
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (_, __) => const Divider(),
                  );
                }
                return const Center(
                  // child: CircularProgressIndicator(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
