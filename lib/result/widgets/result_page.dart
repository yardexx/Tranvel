import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trainvel/result/result.dart';

class ResultPage extends StatelessWidget {
  const ResultPage._();

  static Route<String> route() =>
      MaterialPageRoute(builder: (_) => const ResultPage._());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Train connections'),
        centerTitle: true,
      ),
      body: BlocBuilder<TripCatalogCubit, TripState>(
        builder: (context, state) {
          switch (state.status) {
            case TripStatus.initial:
              return const Center(
                child: Text('Initial state.'),
              );
            case TripStatus.loading:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case TripStatus.success:
              return ListView.separated(
                padding: const EdgeInsets.all(16),
                itemCount: state.trip.trains.length,
                itemBuilder: (_, index) {
                  return TrainCard(
                    train: state.trip.trains[index],
                  );
                },
                separatorBuilder: (_, __) => const SizedBox(height: 16),
              );
            case TripStatus.failure:
              return const Center(
                child: Text('Failed to fetch.'),
              );
          }
        },
      ),
    );
  }
}
