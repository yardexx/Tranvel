import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:trainvel/utils/utils.dart';

class CurrentTicketPanel extends StatelessWidget {
  const CurrentTicketPanel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SlidingUpPanel(
      borderRadius: const BorderRadiusDirectional.vertical(
        top: Radius.circular(16),
      ),
      minHeight: 72,
      maxHeight: 200,
      backdropEnabled: true,
      padding: const EdgeInsets.all(16),
      panel: Center(
        child: Column(
          children: [
            const DraggableIndicator(),
            const SizedBox(height: 8),
            Text(
              'In 30 minutes...',
              style: theme.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Text('Brno hl. n.', style: theme.textTheme.headlineSmall,),
            Container(height: 2, width: 32, color: Colors.grey,),
            Text('Bratislava hl. st.', style: theme.textTheme.headlineSmall,),
            const SizedBox(height: 8),
            Text('On time', style: theme.textTheme.titleLarge?.copyWith(
              color: Colors.green,
              fontWeight: FontWeight.bold,
            ),)
          ],
        ),
      ),
    );
  }
}
