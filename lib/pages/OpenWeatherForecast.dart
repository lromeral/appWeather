import 'package:appweather/models/OpenWeatherForecastObject.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';
import 'package:weather_icons/weather_icons.dart';

class OpenWeatherForecastWidget extends StatefulWidget {
  final OpenWeatherForecastObject forecastData;
  final int index;

  OpenWeatherForecastWidget({this.forecastData, this.index});

  @override
  _WeatherWidgetState createState() => _WeatherWidgetState();
}

class _WeatherWidgetState extends State<OpenWeatherForecastWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool isNewDay = false;
    double lluvia = 0.0;

    if (widget.index > 0) {
      int dayAtual = int.parse(DateFormat('d').format(
          DateTime.fromMillisecondsSinceEpoch(
              widget.forecastData.list[widget.index].dt * 1000)));

      var dayBefore = int.parse(DateFormat('d').format(
          DateTime.fromMillisecondsSinceEpoch(
              widget.forecastData.list[widget.index - 1].dt * 1000)));

      (dayAtual == dayBefore) ? isNewDay = false : isNewDay = true;
    } else {
      isNewDay = true;
    }

    //Lluvia

    if (widget.forecastData.list[widget.index].rain != null) {
      lluvia = widget.forecastData.list[widget.index].rain.the3H;
    }

    return Card(
      child: Column(
        children: <Widget>[
          if (isNewDay)
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: Container(
                    color: Colors.blue[800],
                    padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                    child: Text(
                      '${DateFormat('EEEE d MMMM', 'es').format(DateTime.fromMillisecondsSinceEpoch((widget.forecastData.list[widget.index].dt) * 1000))}',
                      style: TextStyle(fontSize: 20.0, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    CircleAvatar(
                      backgroundImage: NetworkImage(
                          'http://openweathermap.org/img/wn/${widget.forecastData.list[widget.index].weather[0].icon}@2x.png'),
                      backgroundColor: Colors.white,
                      radius: 30.0,
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    // Text(
                    //     '${DateFormat('EEEE', 'es').format(DateTime.fromMillisecondsSinceEpoch((widget.forecastData.list[widget.index].dt) * 1000))}'),
                    Text(
                      '${DateFormat('Hm', 'es').format(DateTime.fromMillisecondsSinceEpoch((widget.forecastData.list[widget.index].dt) * 1000))}',
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ],
                ),
              ),

              ///////////////ICONOS CENTRALES
              Expanded(
                flex: 4,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Icon(WeatherIcons.humidity,
                                size: 11, color: Colors.grey),
                            Text(
                                '${widget.forecastData.list[widget.index].main.humidity}%Hr', style: TextStyle(fontSize: 12.0),),
                            Icon(
                              WeatherIcons.cloud,
                              size: 12.0,
                              color: Colors.grey,
                            ),
                            Text(
                                '${widget.forecastData.list[widget.index].clouds.all}%', style: TextStyle(fontSize: 12.0),),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Icon(
                          WeatherIcons.strong_wind,
                          size: 12,
                          color: Colors.grey,
                        ),
                        Text(
                          '${(widget.forecastData.list[widget.index].wind.speed * 3.6).toStringAsFixed(0)}km/h',
                          style: TextStyle(fontSize: 12.0),
                        ),
                        Icon(
                          WeatherIcons.rain,
                          size: 12,
                          color: Colors.grey,
                        ),
                        Text('$lluvia mm', style: TextStyle(fontSize: 12.0),),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 6,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Expanded(
                          flex: 3,
                          child: Column(
                            children: <Widget>[
                              Text(
                                widget.forecastData.list[widget.index].main.temp
                                        .toStringAsFixed(1) +
                                    'ºC',
                                style: TextStyle(fontSize: 25.0),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Column(
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Text(
                                    widget.forecastData.list[widget.index].main
                                            .tempMax
                                            .toStringAsFixed(1) +
                                        'ºC',
                                    style: TextStyle(
                                        color: Colors.red, fontSize: 10.0),
                                  ),
                                  Icon(
                                    Icons.arrow_drop_up,
                                    color: Colors.red,
                                  )
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  Text(
                                    widget.forecastData.list[widget.index].main
                                            .tempMin
                                            .toStringAsFixed(1) +
                                        'ºC',
                                    style: TextStyle(
                                        color: Colors.blue, fontSize: 10.0),
                                  ),
                                  Icon(
                                    Icons.arrow_drop_down,
                                    color: Colors.blue,
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
