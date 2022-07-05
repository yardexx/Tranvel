import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trainvel/result/models/models.dart';
import 'package:trainvel/ticket_catalog/cubit/ticket_catalog_cubit.dart';
import 'package:trainvel/utils/utils.dart';

class BuySheetWidget extends StatelessWidget {
  const BuySheetWidget({super.key, required this.train});

  final Train train;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 32,
        vertical: 16,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Center(child: DraggableIndicator()),
          const SizedBox(
            height: 8,
          ),
          ListTile(
            title: Text(
              '${train.category} ${train.number}',
              style: theme.textTheme.titleLarge,
            ),
            subtitle: Text(
              '${train.journey.first.name} - ${train.journey.last.name}',
              style: theme.textTheme.titleMedium,
            ),
          ),
          Text(
            'Total price:',
            style: theme.textTheme.labelLarge,
          ),
          Text('13.25€', style: theme.textTheme.headlineMedium,),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                onPrimary: theme.colorScheme.onPrimary,
                primary: theme.colorScheme.primary,
              ).copyWith(elevation: ButtonStyleButton.allOrNull(0)),
              onPressed: () {
                context.read<TicketCatalogCubit>().saveTicket(train);
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Ticket bought'),
                  ),
                );
              },
              child: const Text('Buy ticket'),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
          ),
        ],
      ),
    );
  }
}
