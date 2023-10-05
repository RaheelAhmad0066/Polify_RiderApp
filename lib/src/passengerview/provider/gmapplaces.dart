import 'package:flutter/material.dart';

class Placesvariables with ChangeNotifier {
  String pickupplacesvalue = 'Pickup Location';
  String destinationvalue = 'Destination Location';

  setnewpickup(String value) async {
    pickupplacesvalue = value;
    notifyListeners();
  }

  setnewdestination(String value) async {
    destinationvalue = value;
    notifyListeners();
  }

  @override
  notifyListeners();
}
