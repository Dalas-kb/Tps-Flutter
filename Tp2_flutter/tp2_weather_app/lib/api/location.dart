import 'dart:developer';

import 'package:geolocator/geolocator.dart';

class Location {
  double? lat;
  double? lon;

  Future<void> getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
              desiredAccuracy: LocationAccuracy.best)
          .timeout(const Duration(seconds: 15));

      lat = position.latitude;
      lon = position.longitude;
    } catch (e) {
      log('Quelque chose ne va pas $e');
    }
  }
}
