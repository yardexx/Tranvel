
import 'package:fake_train_api/src/models/models.dart';
import 'package:fake_train_api/src/utils/utils.dart';

class TripRequestFailure implements Exception {}

class TripNotFoundFailure implements Exception {}

class TrainRequestFailure implements Exception {}

class TrainNotFoundFailure implements Exception {}

class FakeTrainApiClient {
  Future<List<Train>> getTrainJourney(
      final String start, final String destination, final DateTime date,) {

    final generator = TrainGenerator(start, destination, date);

    return Future.delayed(
        const Duration(seconds: 3),
        () => generator.generate(15),);
  }
}
