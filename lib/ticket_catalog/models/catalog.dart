import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:trainvel/ticket_catalog/models/ticket.dart';

part 'catalog.g.dart';

@JsonSerializable()
class Catalog extends Equatable {
  const Catalog({required this.tickets});

  factory Catalog.fromJson(Map<String, dynamic> json) =>
      _$CatalogFromJson(json);

  Map<String, dynamic> toJson() => _$CatalogToJson(this);

  final List<Ticket> tickets;

  Ticket getActive() => tickets.firstWhere(
        (ticket) =>
            ticket.train.journey.last.arrival.millisecondsSinceEpoch <
            DateTime.now().millisecondsSinceEpoch,
      );

  static const empty = Catalog(
    tickets: [],
  );



  @override
  List<Object?> get props => [tickets];
}
