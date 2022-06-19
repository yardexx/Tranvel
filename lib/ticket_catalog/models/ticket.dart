import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:trainvel/result/models/train.dart';

part 'ticket.g.dart';

@JsonSerializable()
class Ticket extends Equatable {
  const Ticket({
    required this.id,
    required this.train,
    required this.price,
  });

  factory Ticket.fromJson(Map<String, dynamic> json) =>
      _$TicketFromJson(json);

  Map<String, dynamic> toJson() => _$TicketToJson(this);

  final int id;
  final Train train;
  final double price;

  @override
  List<Object?> get props => [id, train, price];
}
