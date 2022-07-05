import 'package:flutter/material.dart';
import 'package:trainvel/utils/utils.dart';

class UserPage extends StatelessWidget {
  const UserPage._();

  static Route<String> route() =>
      MaterialPageRoute(builder: (_) => const UserPage._());

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('User profile'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              const CircleAvatar(
                radius: 64,
                foregroundImage: NetworkImage(
                  'https://images.pexels.com/photos/2379005/pexels-photo-2379005.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
                ),
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Ryan',
                    style: theme.textTheme.titleLarge,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    'Arnold',
                    style: theme.textTheme.titleLarge,
                  ),
                ],
              ),
              const Text('Traveller beginner'),
              const SizedBox(height: 8),
              BlueCard(
                title: 'Travel stats',
                child: Column(
                  children: const [
                    StatTile(
                      title: 'Distance',
                      description: 'Total travelled distance',
                      value: '0 km',
                    ),
                    StatTile(
                      title: 'Trains',
                      description: 'Amount of trains you took',
                      value: '0',
                    ),
                    StatTile(
                      title: 'Emissions',
                      description: 'Emissions saved by using public transport',
                      value: '0',
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }
}

class StatTile extends StatelessWidget {
  const StatTile({
    super.key,
    required this.title,
    required this.description,
    required this.value,
  });

  final String title;
  final String description;
  final String value;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ListTile(
      title: Text(title),
      subtitle: Text(description),
      trailing: Text(
        value,
        style:
            theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
      ),
    );
  }
}
