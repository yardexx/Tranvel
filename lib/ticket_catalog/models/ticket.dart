import 'package:equatable/equatable.dart';
import 'package:trainvel/result/models/train.dart';

class Ticket extends Equatable {
  const Ticket(this.id, this.train, this.price);

  final int id;
  final Train train;
  final double price;

  @override
  List<Object?> get props => [id, train, price];
}
