import 'dart:convert';

import 'package:coffe_app/models/weather_Model.dart';
import 'package:http/http.dart' as http;

class WeatherServices {
  // fun get weather data..
  String baserUrl = 'http://api.weatherapi.com/v1';
  String apiKey = '5a4624e254964df3b77210034231407';
  Future<WeatherModel> getWeather({required String cityCityname}) async {
    http.Response response = await http.get(Uri.parse(
        '$baserUrl/forecast.json?key=$apiKey&q=London&days=1&aqi=no&alerts=no'));
    Map<String, dynamic> data =
        jsonDecode(response.body); // convert string to jsondata

    WeatherModel weather = WeatherModel.fromJson(data);
    return weather;
  }
}
