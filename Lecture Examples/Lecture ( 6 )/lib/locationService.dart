import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';


class LocationService
{

  late final  longitude;
  late  final latitude;

  Future<void> GetLocation() async
  {
    LocationPermission permission = await Geolocator.requestPermission();

    if (permission == LocationPermission.denied)
    {
      print("Permission Problem");
    }
    else
    {
      Position position = await Geolocator.getCurrentPosition(locationSettings: LocationSettings(accuracy: LocationAccuracy.high,distanceFilter: 100));

      longitude = position.longitude;
      latitude = position.latitude;


      print(position.timestamp);
    }
  }
}
