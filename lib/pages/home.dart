import 'package:appweather/models/Arguments.dart';
import 'package:appweather/models/OpenWeatherCurrentObject.dart';
import 'package:appweather/models/OpenWeatherForecastObject.dart';
import 'package:appweather/pages/OpenWeatherCurrent.dart';
import 'package:flutter/material.dart';
import 'package:appweather/pages/OpenWeatherForecast.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  OpenWeatherForecastObject forecastData;
  OpenWeatherCurrentObject currentData;

  getWeatherData() async {
    Argumentos args = ModalRoute.of(context).settings.arguments;
    this.currentData = args.current;
    this.forecastData = args.forecast;
  }

  @override
  Widget build(BuildContext context) {
    getWeatherData();

    print(this.currentData.main.temp);
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: Text(
          '${forecastData.city.name}',
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            OpenWeatherCurrentWidget(
              currentData: currentData,
            ),
            SizedBox(
              height: 30.0,
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: forecastData.list.length,
                  itemBuilder: (context, index) {
                    return OpenWeatherForecastWidget(
                      forecastData: this.forecastData,
                      index: index,
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
