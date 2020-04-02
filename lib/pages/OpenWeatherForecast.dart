import 'package:appweather/models/WeatherObject.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';

// ignore: non_constant_identifier_names
class OpenWeatherForecastWidget extends StatefulWidget {
  WeatherObject wd;
  int index;

  OpenWeatherForecastWidget
({this.wd, this.index});

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
    return Card(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              CircleAvatar(
                backgroundImage: NetworkImage(
                    'http://openweathermap.org/img/wn/${widget.wd.list[widget.index].weather[0].icon}@2x.png'),
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
                  '${DateFormat('EEEE', 'es').format(DateTime.fromMillisecondsSinceEpoch((widget.wd.list[widget.index].dt) * 1000))}'),
              Text(
                  '${DateFormat('EEEE', 'es').add_Hm().format(DateTime.fromMillisecondsSinceEpoch((widget.wd.list[widget.index].dt) * 1000))}'),
              Text('${widget.wd.list[widget.index].weather[0].description}'),
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
                        widget.wd.list[widget.index].main.temp
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
                            widget.wd.list[widget.index].main.tempMax
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
                            widget.wd.list[widget.index].main.tempMin
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
