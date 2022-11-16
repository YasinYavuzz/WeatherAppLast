import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:weather_ui/models/current_weather_response.dart';
import 'package:weather_ui/models/hourly_weather_response.dart';


Future<CurrentWeatherResponse?> getCurrentData(context) async {
  CurrentWeatherResponse currentWeatherResponse;
  try {
    final response = await http.get(Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?lat=41.025152&lon=29.019159&appid=cd2a806afdcc70e043cc8c61241ab5e3&units=metric"));
    currentWeatherResponse =
        CurrentWeatherResponse.fromJson(jsonDecode(response.body));
    print(response.body);
    return currentWeatherResponse;
  } catch (e) {
    log(e.toString());
  }
  return null;
}

Future<HourlyWeatherResponse?> getHourlyData(context) async {
  HourlyWeatherResponse hourlyWeatherResponse;
  try {
    final response = await http.get(Uri.parse(
        "http://api.openweathermap.org/data/2.5/forecast?lat=41.025152&lon=29.019159&appid=cd2a806afdcc70e043cc8c61241ab5e3&id=524901&units=metric"));
    hourlyWeatherResponse =
        HourlyWeatherResponse.fromJson(jsonDecode(response.body));
    print(response.body);
    return hourlyWeatherResponse;
  } catch (e) {
    log(e.toString());
  }
  return null;
}
