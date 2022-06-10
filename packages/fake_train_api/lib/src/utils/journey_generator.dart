import 'dart:math';

import 'package:fake_train_api/src/models/models.dart';

class JourneyGenerator {

  JourneyGenerator(this.startPoint, this.endPoint, this.startDate);
  final String startPoint;
  final String endPoint;
  final DateTime startDate;

  List<TrainStop> generate(final int quantity) {
    final random = Random();

    var lastArrival = startDate;
    var lastDeparture = startDate;
    return List.generate(quantity, (final index) {
      if (index == 0) {
        return TrainStop(
          arrival: lastDeparture,
          departure: lastDeparture,
          name: startPoint,
        );
      }

      if (index == quantity - 1) {
        return TrainStop(
          arrival: lastDeparture,
          departure: lastDeparture,
          name: endPoint,
        );
      }

      lastArrival = lastDeparture;
      lastDeparture = lastDeparture.add(
        Duration(minutes: random.nextInt(45) + 15),
      );

      return TrainStop(
        arrival: lastArrival,
        departure: lastDeparture,
        name: 'Something',
      );
    });
  }
}
