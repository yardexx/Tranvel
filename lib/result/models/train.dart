import 'package:trainvel/result/models/models.dart';

class Train {
  const Train({
    required this.id,
    required this.number,
    required this.carrier,
    required this.journeyDate,
    required this.journey,
    required this.delay,
    required this.category,
    this.name,
  });

  final String id;
  final int number;
  final String? name;
  final Carrier carrier;
  final DateTime journeyDate;
  final List<Location> journey;
  final String category;
  final int delay;

  DateTime journeyLength(DateTime departure, DateTime arrival) {
    return DateTime.fromMillisecondsSinceEpoch(
      departure.millisecondsSinceEpoch - arrival.millisecondsSinceEpoch,
    );
  }
}
