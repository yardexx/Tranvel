import 'dart:convert';

import 'package:tickets_api/tickets_api.dart' as database;
import 'package:trainvel/result/models/train.dart';

class Ticket {
  const Ticket({
    this.id,
    required this.train,
    required this.price,
    required this.date,
  });

  factory Ticket.fromRepository(database.Ticket ticket) {
    return Ticket(
      train: Train.fromJson(jsonDecode(ticket.train) as Map<String, dynamic>),
      price: ticket.price,
      date: DateTime.fromMillisecondsSinceEpoch(ticket.date),
    );
  }

  final int? id;
  final Train train;
  final double price;
  final DateTime date;
}
