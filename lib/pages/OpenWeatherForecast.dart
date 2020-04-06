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

    //DIRECCION VIENTO

    String getDirection (int deg){

      String dir="";
      
      //NORTH
      if (deg >= 337.5 && deg < 22.5) dir = 'N';      //N
      if (deg >= 22.5 && deg < 67.5)  dir= 'NE';//NE
      if (deg >= 67.5 && deg < 112.5) dir = 'E';  //E
      
      if (deg >= 112.5 && deg < 157.5) dir = 'SE';      //SE

      if (deg >= 157.5 && deg < 202.5) dir = 'S';//S
      if (deg >= 202.5 && deg < 247.5) dir = 'SO';  //SO
      if (deg >= 247.5 && deg < 292.5) dir = 'O';      //O
      if (deg >= 292.5 && deg < 337.5) dir = 'NO';//NO

    return dir;
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
                    Text(
                      '${DateFormat('Hm', 'es').format(DateTime.fromMillisecondsSinceEpoch((widget.forecastData.list[widget.index].dt) * 1000))}',
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ],
                ),
              ),

              ///////////////ICONOS CENTRALES
              Expanded(
                flex: 5,
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                          child: Column(
                            children: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Icon(
                                        WeatherIcons.humidity,
                                        size: 11,
                                        color: Colors.grey,
                                      ),
                                      Icon(
                                        WeatherIcons.cloud,
                                        size: 12.0,
                                        color: Colors.grey,
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Icon(
                                        WeatherIcons.strong_wind,
                                        size: 12,
                                        color: Colors.grey,
                                      ),
                                      Icon(
                                        WeatherIcons.rain,
                                        size: 12,
                                        color: Colors.grey,
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        '${widget.forecastData.list[widget.index].main.humidity}%Hr',
                                        style: TextStyle(fontSize: 12.0),
                                      ),
                                      Text(
                                        '${widget.forecastData.list[widget.index].clouds.all}%',
                                        style: TextStyle(
                                          fontSize: 12.0
                                          ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                          Text(
                                            '${(widget.forecastData.list[widget.index].wind.speed * 3.6).toStringAsFixed(0)}km/h ${getDirection(widget.forecastData.list[widget.index].wind.deg)}',
                                            style: TextStyle(fontSize: 12.0),
                                          ),
                                      if (lluvia==0)
                                      Text('$lluvia mm',style: TextStyle(fontSize: 12.0),
                                      ),
                                      if (lluvia>0 ) Text('$lluvia mm',style: TextStyle(fontSize: 12.0, color: Colors.blueAccent),),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ]),
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
