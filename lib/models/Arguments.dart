import 'package:appweather/models/OpenWeatherCurrentObject.dart';
import 'package:appweather/models/OpenWeatherForecastObject.dart';

class Argumentos {

  final OpenWeatherCurrentObject current;
  final OpenWeatherForecastObject forecast;

  Argumentos({this.current, this.forecast});
    
}