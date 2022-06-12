import 'package:fake_train_api/fake_train_api.dart';
import 'package:train_repository/src/models/models.dart';

class TrainRepository {
  TrainRepository({final FakeTrainApiClient? fakeTrainApiClient})
      : _fakeTrainApiClient = fakeTrainApiClient ?? FakeTrainApiClient();

  final FakeTrainApiClient _fakeTrainApiClient;

  Future<Trip> getTrip(
    final String start,
    final String destination,
    final DateTime date,
  ) async {

    final trains =
        await _fakeTrainApiClient.getTrainJourney(start, destination, date);

    return Trip(
      start: start,
      destination: destination,
      trains: trains,
    );
  }
}
