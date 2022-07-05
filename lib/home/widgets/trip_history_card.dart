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
    context.read<TicketCatalogCubit>().fetchAllTickets();
    return BlueCard(
      title: 'Last rides',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BlocBuilder<TicketCatalogCubit, TicketCatalogState>(
            builder: (context, state) {
              print(state.status);
              switch (state.status) {
                case TicketCatalogStatus.initial:
                case TicketCatalogStatus.loading:
                  return const Center(
                    child: Text('Loading'),
                  );
                case TicketCatalogStatus.success:
                  final trips = state.tickets;
                  if (trips.isEmpty) {
                    return const EmptyHistory();
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
    return Column(
      children: [
        ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: trips.length < 3 ? trips.length : 3,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(
                '${trips[index].train.category} ${trips[index].train.number}',
              ),
              subtitle: Text(
                DateFormat('dd.MM.yyyy HH:MM').format(
                  trips[index].train.journeyDate,
                ),
              ),
              trailing: const Icon(Icons.arrow_forward_ios),
            );
          },
          separatorBuilder: (_, __) => const Divider(),
        ),
        if (trips.length > 3)
          SizedBox(
            width: double.infinity,
            child: TextButton(
              onPressed: () => print('Button pressed'),
              child: Text('Show all rides'),
            ),
          ),
      ],
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
