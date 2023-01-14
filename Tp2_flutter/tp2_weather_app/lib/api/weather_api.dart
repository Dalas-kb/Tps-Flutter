// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:tp2_weather_app/model/current_weather.dart';
import 'package:tp2_weather_app/api/location.dart';

class WeatherApi {
  Future<WeatherModel> fetchWeatherModel({String? city, bool? isCity}) async {
    Location location = Location();
    await location.getCurrentLocation();

    Map<String, String?> parameters;

    if (isCity == true) {
      var queryP = {
        'MYKEY': Constant.MY_KEY,
        'units': 'metric',
        'q': city,
      };

      parameters = queryP;
    } else {
      var queryP = {
        'MYKEY': Constant.MY_KEY,
        'units': 'metric',
        'lat': location.lat.toString(),
        'lon': location.lon.toString(),
      };

      parameters = queryP;
    }

    var uri = Uri.https(
      Constant.URL,
      Constant.FORECAST,
      parameters,
    );

    log('request: ${uri.toString()}');

    var response = await http.get(uri);

    print('response: ${response.body}');

    if (response.statusCode == 200) {
      return WeatherModel.fromJson(json.decode(response.body));
    } else {
      throw Future.error('Erorr response');
    }
  }
}

class Constant {
  static const String MY_KEY = '5ca464362cd9acddaf0a6153e5d74aaa';
  static const String SCHEME = 'https://';
  static const String URL = 'api.openweathermap.org';
  static const String FORECAST = 'data/2.5/forecast';
}
