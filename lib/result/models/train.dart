import 'package:trainvel/result/models/models.dart';

class Train {
  final int number;
  final String name;
  final Carrier carrier;
  final DateTime journeyDate;
  final List<Location> journey;
  final int delay;

  const Train({
    required this.number,
    required this.name,
    required this.carrier,
    required this.journeyDate,
    required this.journey,
    required this.delay,
  });

  DateTime journeyLength(DateTime departure, DateTime arrival) {
    return DateTime.fromMillisecondsSinceEpoch(
      departure.millisecondsSinceEpoch - arrival.millisecondsSinceEpoch,
    );
  }
}
