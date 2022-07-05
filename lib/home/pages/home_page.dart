import 'package:flutter/material.dart';
import 'package:trainvel/home/widgets/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trainvel/ticket_catalog/cubit/ticket_catalog_cubit.dart';
import 'package:trainvel/ticket_catalog/models/ticket.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Ticket? currentTicket =
        context.watch<TicketCatalogCubit>().getCurrentTicket();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Trainvel'),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: const [
                  UserCard(),
                  SizedBox(
                    height: 16,
                  ),
                  SearchCard(),
                  SizedBox(
                    height: 16,
                  ),
                  IncidentCard(),
                  SizedBox(
                    height: 16,
                  ),
                  TripHistoryCard(),
                  SizedBox(
                    height: 64,
                  ),
                ],
              ),
            ),
          ),
          if (currentTicket == null) const CurrentTicketPanel() else Container()
        ],
      ),
    );
  }
}
