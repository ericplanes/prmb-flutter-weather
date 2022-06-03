import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/weather_model.dart';

String url = "https://api.openweathermap.org/data/2.5/weather?";
String client = "ab3eb740f0748a6be1717aceb792c0d6";

class WeatherApiClient {
  Future<Weather>? getCurrentWeather(String? location) async {
    var endpoint = Uri.parse(
        url + "q=$location" + "&" + "appid=$client" + "&" + "units=metric");
    var response = await http.get(endpoint);
    var body = jsonDecode(response.body);
    print(Weather.fromJson(body).cityName);
    return Weather.fromJson(body);
  }
}
