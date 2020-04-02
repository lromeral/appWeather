import 'package:flutter/material.dart';

class OpenWeatherCurrentWidget extends StatefulWidget {
  @override
  _OpenWeatherCurrentWidgetState createState() => _OpenWeatherCurrentWidgetState();
}

class _OpenWeatherCurrentWidgetState extends State<OpenWeatherCurrentWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Text ('Current'),
    );
  }
}