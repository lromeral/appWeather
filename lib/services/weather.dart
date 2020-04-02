
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:appweather/services/location.dart';
import 'package:appweather/models/WeatherObject.dart';

class OpenWeatherApi {
  Position _myPos = Position();
  static final String apiKey = 'df79bb0a6882db362aa79d760f43183a';
  Map _weather = {};
  WeatherObject weatherData;

  OpenWeatherApi();

  Future<void> _getActualPosition() async {
    MyGeoLocation instance = MyGeoLocation();
    _myPos = await instance.getPosition();
  }

  Future<void> getWeatherForecast() async {
    await _getActualPosition();
    String endPoint =
        'https://api.openweathermap.org/data/2.5/forecast?lat=${this._myPos.latitude}&lon=${this._myPos.longitude}&appid=$apiKey&units=metric&lang=es';
    print(endPoint);
    Response response = await get(endPoint);
    this._weather = jsonDecode(response.body);

    this.weatherData  = WeatherObject.fromJson(this._weather);
  }

    Future<void> getWeatherCurrent() async {
    await _getActualPosition();
    String endPoint =
        'https://api.openweathermap.org/data/2.5/weather?lat=${this._myPos.latitude}&lon=${this._myPos.longitude}&appid=$apiKey&units=metric&lang=es';
    print(endPoint);
    Response response = await get(endPoint);
    this._weather = jsonDecode(response.body);

    this.weatherData  = WeatherObject.fromJson(this._weather);
  }
}
