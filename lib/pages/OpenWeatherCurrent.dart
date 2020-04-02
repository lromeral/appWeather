import 'package:appweather/models/OpenWeatherCurrentObject.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class OpenWeatherCurrentWidget extends StatefulWidget {
  final OpenWeatherCurrentObject currentData;

  OpenWeatherCurrentWidget({this.currentData});

  @override
  _OpenWeatherCurrentWidgetState createState() =>
      _OpenWeatherCurrentWidgetState();
}

class _OpenWeatherCurrentWidgetState extends State<OpenWeatherCurrentWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(5, 5, 5, 0),
                child: Text ('${DateFormat('EEEE', 'es').add_Hm().format(DateTime.fromMillisecondsSinceEpoch((widget.currentData.dt) * 1000))}',
                style: TextStyle(
                  fontSize: 12.0,
                  fontStyle: FontStyle.italic
                ),),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              CircleAvatar(
                backgroundImage: NetworkImage(
                    'http://openweathermap.org/img/wn/${widget.currentData.weather[0].icon}@2x.png'),
                backgroundColor: Colors.white,
                radius: 50.0,
              ),
              Text('${widget.currentData.weather[0].description}'),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  '${widget.currentData.main.temp.toStringAsFixed(1)}ºC',
                  style: TextStyle(fontSize: 30.0),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
