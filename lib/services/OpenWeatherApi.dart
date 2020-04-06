import 'package:http/http.dart';
import 'dart:convert';
import 'package:appweather/models/OpenWeatherForecastObject.dart';
import 'package:appweather/models/OpenWeatherCurrentObject.dart';

class OpenWeatherApi {
  static final String apiKey = 'df79bb0a6882db362aa79d760f43183a';
  OpenWeatherForecastObject forecastData;
  OpenWeatherCurrentObject currentData;

  OpenWeatherApi();

  Future<void> getWeatherForecast(double latitude, double longitude) async {
    Map _data = {};

    String endPoint =
        'https://api.openweathermap.org/data/2.5/forecast?lat=$latitude&lon=$longitude&appid=$apiKey&units=metric&lang=es';
    print(endPoint);
    Response response = await get(endPoint);
    _data = jsonDecode(response.body);

    this.forecastData = OpenWeatherForecastObject.fromJson(_data);

    print('getWeatherForecast');
  }

  Future<void> getWeatherCurrent(double latitude, double longitude) async {
    print("getWeathercurrent");

    Map _data = {};

    String endPoint =
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey&units=metric&lang=es';
    print(endPoint);
    Response response = await get(endPoint);
    _data = jsonDecode(response.body);

    this.currentData = OpenWeatherCurrentObject.fromJson(_data);
  }
}
