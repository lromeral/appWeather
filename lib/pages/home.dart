import 'package:appweather/models/Arguments.dart';
import 'package:appweather/models/OpenWeatherCurrentObject.dart';
import 'package:appweather/models/OpenWeatherForecastObject.dart';
import 'package:appweather/pages/OpenWeatherCurrent.dart';
import 'package:appweather/services/OpenWeatherApi.dart';
import 'package:flutter/material.dart';
import 'package:appweather/pages/OpenWeatherForecast.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  OpenWeatherForecastObject forecastData;
  OpenWeatherCurrentObject currentData;
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  getWeatherData() async {
    Argumentos args = ModalRoute.of(context).settings.arguments;
    this.currentData = args.current;
    this.forecastData = args.forecast;
  }

  Future<void> _refreshData() async {
    OpenWeatherApi instance = OpenWeatherApi();
    await instance.getWeatherForecast();
    await instance.getWeatherCurrent();

    this.build(context);

    _refreshController.refreshCompleted();
  }

  @override
  Widget build(BuildContext context) {
    getWeatherData();

    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: Text(
          '${forecastData.city.name}',
        ),
        centerTitle: true,
        backgroundColor: Colors.blue[800],
      ),
      body: SmartRefresher(
        controller: _refreshController,
        enablePullDown: true,
        enablePullUp: false,
        onRefresh: _refreshData,
        child: Container(
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
      ),
    );
  }
}
