import 'package:flutter/material.dart';

class Trip {
  final int id;
  final String start;
  final String destination;
  final DateTime date;
  final TimeOfDay time;
  final int delay;
  final String carrier;
  final double price;

  Trip({
    required this.id,
    required this.start,
    required this.destination,
    required this.date,
    required this.time,
    required this.delay,
    required this.carrier,
    required this.price,
  });
}
