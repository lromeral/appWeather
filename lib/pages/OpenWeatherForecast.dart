import 'package:appweather/models/OpenWeatherForecastObject.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';

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

    return Card(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              if (isNewDay)
                Text(
                    '${DateFormat('EEEE', 'es').format(DateTime.fromMillisecondsSinceEpoch((widget.forecastData.list[widget.index].dt) * 1000))}',
                    style: TextStyle( 
                      fontSize: 20.0
                    ),),
              CircleAvatar(
                backgroundImage: NetworkImage(
                    'http://openweathermap.org/img/wn/${widget.forecastData.list[widget.index].weather[0].icon}@2x.png'),
                backgroundColor: Colors.white,
                radius: 30.0,
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                  '${DateFormat('EEEE', 'es').format(DateTime.fromMillisecondsSinceEpoch((widget.forecastData.list[widget.index].dt) * 1000))}'),
              Text(
                  '${DateFormat('EEEE', 'es').add_Hm().format(DateTime.fromMillisecondsSinceEpoch((widget.forecastData.list[widget.index].dt) * 1000))}'),
              Text(
                  '${widget.forecastData.list[widget.index].weather[0].description}'),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Text(
                        widget.forecastData.list[widget.index].main.temp
                                .toStringAsFixed(1) +
                            'ºC',
                        style: TextStyle(fontSize: 25.0),
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      SizedBox(
                        width: 10.0,
                      )
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text(
                            widget.forecastData.list[widget.index].main.tempMax
                                    .toStringAsFixed(1) +
                                'ºC',
                            style: TextStyle(color: Colors.red, fontSize: 10.0),
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
                            widget.forecastData.list[widget.index].main.tempMin
                                    .toStringAsFixed(1) +
                                'ºC',
                            style:
                                TextStyle(color: Colors.blue, fontSize: 10.0),
                          ),
                          Icon(
                            Icons.arrow_drop_down,
                            color: Colors.blue,
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
