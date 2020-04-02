import 'package:geolocator/geolocator.dart';

class MyGeoLocation {

  MyGeoLocation();

  Future<Position> getPosition() async {
    Position myPos = Position();
    final geolocator = Geolocator()..forceAndroidLocationManager;

    await geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((pos) => myPos = pos);

    return myPos;
  }
}
