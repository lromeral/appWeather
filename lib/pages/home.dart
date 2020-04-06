import 'package:appweather/models/Arguments.dart';
import 'package:appweather/models/OpenWeatherCurrentObject.dart';
import 'package:appweather/models/OpenWeatherForecastObject.dart';
import 'package:appweather/pages/OpenWeatherCurrent.dart';
import 'package:appweather/services/MyGeoLocation.dart';
import 'package:flutter/material.dart';
import 'package:appweather/pages/OpenWeatherForecast.dart';
import 'package:appweather/services/OpenWeatherApi.dart';
import 'package:geolocator/geolocator.dart';
import 'CitySearch.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  OpenWeatherForecastObject forecastData;
  OpenWeatherCurrentObject currentData;

  double latitude = 0.0, longitude = 0.0;

  Future<Null> _refreshData() async {}

  @override
  Widget build(BuildContext context) {

    print ('args');
    Argumentos args = ModalRoute.of(context).settings.arguments;

    String cityName = '';
    //print ('Args: ${args.forecast.city.name}');


     forecastData = args.forecast;
     currentData = args.current;

    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: Text(
          '$cityName',
        ),
        centerTitle: false,
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                showSearch(context: context, delegate: CitySearch());
              }),
        ],
        backgroundColor: Colors.blue[800],
      ),
      body: RefreshIndicator(
        onRefresh: _refreshData,
        child: SafeArea(
          child: Column(
            children: <Widget>[
              OpenWeatherCurrentWidget(
                currentData: currentData,
              ),
              SizedBox(
                height: 10.0,
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
      ),
    );
  }
}
