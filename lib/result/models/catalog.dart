import 'package:flutter/foundation.dart';
import 'package:trainvel/result/models/trip.dart';

class Catalog extends ChangeNotifier {
  List<Trip> _catalog = [];

  set trips(List<Trip> newTripResults) {
    _catalog = newTripResults;
    notifyListeners();
  }

  List<Trip> get trips => _catalog;

  Trip getTripById(int id) => _catalog.firstWhere((trip) => trip.id == id);
}