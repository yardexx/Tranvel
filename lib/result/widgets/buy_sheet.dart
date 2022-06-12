import 'package:flutter/material.dart';
import 'package:trainvel/result/models/models.dart';
import 'package:trainvel/utils/utils.dart';

class BuySheetWidget extends StatelessWidget {
  const BuySheetWidget({super.key, required this.train});

  final Train train;

  @override
  Widget build(BuildContext context) {
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
                // Foreground color
                onPrimary: Theme.of(context).colorScheme.onPrimary,
                // Background color
                primary: Theme.of(context).colorScheme.primary,
              ).copyWith(elevation: ButtonStyleButton.allOrNull(0)),
              onPressed: () => Navigator.pop(context),
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
