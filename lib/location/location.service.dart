import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hive/hive.dart';

class LocationService extends ChangeNotifier {
  String locality;

  Future<void> getLocation() async {
    final box = await Hive.openBox('location');
    if (!await canUseLocation(await Geolocator.checkPermission())) return;

    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    List<Placemark> placemarks = await placemarkFromCoordinates(position.latitude, position.longitude);

    locality = placemarks.first.locality;

    box.put('locality', locality);
  }

  Future<bool> canUseLocation(LocationPermission permission) async {
    if (LocationPermission.denied == permission || LocationPermission.deniedForever == permission) {
      if (LocationPermission.denied == permission) return canUseLocation(await Geolocator.requestPermission());

      return false;
    }

    return true;
  }
}
