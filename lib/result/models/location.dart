// TODO: Add longitude and latitude.
class Location {
  final String name;
  final DateTime arrival;
  final DateTime departure;

  const Location({
    required this.arrival,
    required this.departure,
    required this.name,
  });
}
