import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:trainvel/home/widgets/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Trainvel'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hi, Ryan!',
                        style: theme.textTheme.headline4?.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Hope, you're having a good day.",
                        style: theme.textTheme.subtitle1,
                      ),
                    ],
                  ),
                  const CircleAvatar(
                    radius: 32,
                    foregroundImage: NetworkImage(
                      'https://images.pexels.com/photos/2379005/pexels-photo-2379005.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              const SearchCard(),
              const SizedBox(
                height: 16,
              ),
              const IncidentCard(),
              const SizedBox(
                height: 16,
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Last rides',
                        style: theme.textTheme.headline5,
                      ),
                      ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 3,
                        shrinkWrap: true,
                        itemBuilder: (context, _) {
                          return ListTile(
                            onTap: () => debugPrint('ListTile tapped.'),
                            title: const Text('Brno - Bratislava'),
                            subtitle: Text(
                              DateFormat('dd.MM.yyyy').format(DateTime.now()),
                            ),
                            trailing: const Chip(
                              label: Text('R606'),
                              avatar: CircleAvatar(
                                child: Text('R'),
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (_, __) => const Divider(),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
