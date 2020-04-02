import 'package:flutter/material.dart';
import 'package:appweather/services/weather.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  getWeatherData() async{
    OpenWeatherApi instance = OpenWeatherApi();
    await instance.getWeatherForecast();
    Navigator.pushReplacementNamed(context, '/home', arguments: instance.weatherData);
  }


  @override
  initState() {
    super.initState();
    getWeatherData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[500],
      body: SafeArea(
        child: Center (
          child: SpinKitCircle (
            color: Colors.white,
            size: 90.0,

          ),
        ),
      ),
    );
  }
}
