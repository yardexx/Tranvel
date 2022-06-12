import 'package:flutter/material.dart';

class DraggableIndicator extends StatelessWidget {
  const DraggableIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 4,
      width: 48,
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
}
