import 'package:flutter/material.dart';
import 'package:trainvel/result/models/models.dart';

class BuySheetWidget extends StatelessWidget {

  const BuySheetWidget({super.key, required this.train});

  final Train train;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16,),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
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
