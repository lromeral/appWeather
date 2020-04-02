
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:appweather/services/location.dart';
import 'package:appweather/models/OpenWeatherForecastObject.dart';
import 'package:appweather/models/OpenWeatherCurrentObject.dart';

class OpenWeatherApi {
  Position _myPos = Position();
  static final String apiKey = 'df79bb0a6882db362aa79d760f43183a';
  OpenWeatherForecastObject forecastData;
  OpenWeatherCurrentObject currentData;

  OpenWeatherApi();

  Future<void> _getActualPosition() async {
    MyGeoLocation instance = MyGeoLocation();
    _myPos = await instance.getPosition();
  }

  Future<void> getWeatherForecast() async {
    Map _data = {};

    await _getActualPosition();
    String endPoint =
        'https://api.openweathermap.org/data/2.5/forecast?lat=${this._myPos.latitude}&lon=${this._myPos.longitude}&appid=$apiKey&units=metric&lang=es';
    print(endPoint);
    Response response = await get(endPoint);
    _data = jsonDecode(response.body);

    this.forecastData  = OpenWeatherForecastObject.fromJson(_data);

    print ('getWeatherForecast');
  }

    Future<void> getWeatherCurrent() async {

      print ("getWeathercurrent");

    Map _data ={};

    await _getActualPosition();
    String endPoint =
        'https://api.openweathermap.org/data/2.5/weather?lat=${this._myPos.latitude}&lon=${this._myPos.longitude}&appid=$apiKey&units=metric&lang=es';
    print(endPoint);
    Response response = await get(endPoint);
    _data = jsonDecode(response.body);

    this.currentData  = OpenWeatherCurrentObject.fromJson(_data);
  }
}
