import 'package:appweather/models/WeatherObject.dart';
import 'package:appweather/pages/OpenWeatherCurrent.dart';
import 'package:flutter/material.dart';
import 'package:appweather/pages/OpenWeatherForecast.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  WeatherObject wd;

  getWeatherData() async {
    this.wd = ModalRoute.of(context).settings.arguments;
  }

  @override
  Widget build(BuildContext context) {
    getWeatherData();
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: Text(
          '${wd.city.name}',
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            OpenWeatherCurrentWidget(),
            SizedBox(height: 30.0,),
            Expanded(
              child: ListView.builder(
                  itemCount: wd.list.length,
                  itemBuilder: (context, index) {
                    if (index == 5) {
                      return Text('5');
                    } else {
                      return OpenWeatherForecastWidget(
                        wd: this.wd,
                        index: index,
                      );
                    }
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
