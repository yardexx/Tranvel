import 'package:floor/floor.dart';

@entity
class Ticket {
  const Ticket({
    this.id,
    required this.date,
    required this.train,
    required this.price,
  });

  @PrimaryKey(autoGenerate: true)
  final int? id;
  final int date;
  final String train;
  final double price;
}
