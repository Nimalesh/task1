import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather/weather_services.dart';
import 'package:weather/weather_model.dart';


//bbab46c8ee4346a89c6105128231703


class WeatherService {
  Future<Weather> getWeatherData(String place) async {

      final queryParameters = {
        'key': 'bbab46c8ee4346a89c6105128231703',
        'q': place,
      };
      final uri = Uri.http('api.weatherapi.com', '/v1/current.json', queryParameters);
      final response = await http.get(uri);
      print(response.body);
      final json = jsonDecode(response.body);
      return Weather.fromJson(json);
    }
  }
