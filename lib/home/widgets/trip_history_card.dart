import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:trainvel/ticket_catalog/cubit/ticket_catalog_cubit.dart';
import 'package:trainvel/ticket_catalog/models/ticket.dart';
import 'package:trainvel/utils/utils.dart';

class TripHistoryCard extends StatelessWidget {
  const TripHistoryCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    context.watch<TicketCatalogCubit>().fetchTickets();

    return BlueCard(
      title: 'Last rides',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BlocBuilder<TicketCatalogCubit, TicketCatalogState>(
            builder: (context, state) {
              switch (state.status) {
                case TicketCatalogStatus.initial:
                case TicketCatalogStatus.loading:
                  return const Center(
                    child: Text('Loading'),
                  );
                case TicketCatalogStatus.success:
                  final trips = state.tickets;
                  if (trips.isEmpty) {
                    return EmptyHistory();
                  }
                  return RideHistory(trips: trips);
                case TicketCatalogStatus.failure:
                  return const Center(
                    child: Text('Failed to load history'),
                  );
              }
            },
          ),
        ],
      ),
    );
  }
}

class RideHistory extends StatelessWidget {
  const RideHistory({
    super.key,
    required this.trips,
  });

  final List<Ticket> trips;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: trips.length < 3 ? trips.length : 3,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return ListTile(
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
}

class EmptyHistory extends StatelessWidget {
  const EmptyHistory({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Center(
      child: Column(
        children: [
          Icon(
            Icons.history,
            size: 64,
            color: Colors.black.withOpacity(.2),
          ),
          Text(
            'No recent trips',
            style: theme.textTheme.bodyLarge,
          ),
        ],
      ),
    );
  }
}
