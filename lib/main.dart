import 'package:flutter/material.dart';
import 'package:weather/weather_services.dart';
void main(){
  runApp(weatherapp());
}

class weatherapp extends StatefulWidget {
  const weatherapp({Key? key}) : super(key: key);

  @override
  State<weatherapp> createState() => _weatherappState();
}

class _weatherappState extends State<weatherapp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WeatherApp(),
    );
  }
}


