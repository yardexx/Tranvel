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
        children: [
          const DraggableIndicator(),
          const SizedBox(
            height: 8,
          ),
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
                  SnackBar(
                    action: SnackBarAction(label: 'Undo', onPressed: () {}),
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
                print('Operation cancelled');
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
