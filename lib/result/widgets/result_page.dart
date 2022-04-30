import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trainvel/result/result.dart';

class ResultPage extends StatelessWidget {
  const ResultPage._({Key? key}) : super(key: key);

  static Route<String> route() =>
      MaterialPageRoute(builder: (_) => const ResultPage._());

  @override
  Widget build(BuildContext context) {
    final _trips = context.watch<Catalog>().trips;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Train connections'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: _trips.length,
        itemBuilder: (_, index) {
          final currentTrip = _trips[index];
          return Column(
            children: [
              Text(currentTrip.start),
              Text(currentTrip.destination),
            ],
          );
        },
      ),
    );
  }
}
