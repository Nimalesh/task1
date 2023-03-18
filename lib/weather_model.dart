import 'package:flutter/cupertino.dart';

class Weather {
  final double temperatureC;
  final double temperatureF;
  final String condition;
  final double wind;
  final double humidity;


  Weather({
    this.temperatureC = 0,
    this.temperatureF = 0,
    this.wind=0,
    this.humidity=0,
    this.condition = "Sunny",


  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      temperatureC: json['current']['temp_c'],
      temperatureF: json['current']['temp_f'],
      wind: json['current']['wind_kph'],
      humidity: json['current']['humidity'],



      condition: json['current']['condition']['text'],
    );
  }
}