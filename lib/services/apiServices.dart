import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:weather_ui/models/current_weather_response.dart';
import 'package:weather_ui/models/hourly_weather_response.dart';

import 'logging.dart';

final Dio _dio = Dio(BaseOptions(
  baseUrl: "https://api.openweathermap.org/data/2.5/",
  connectTimeout: 5000,
  receiveTimeout: 3000))..interceptors.add(Logging());

Future<CurrentWeatherResponse?> getCurrentData(context) async {
  CurrentWeatherResponse currentWeatherResponse;
  try {
    // final response = await http.get(Uri.parse(
    //     "https://api.openweathermap.org/data/2.5/weather?lat=41.025152&lon=29.019159&appid=cd2a806afdcc70e043cc8c61241ab5e3&units=metric"));
    final response = await _dio.get("weather?lat=41.947221&lon=30.127834&appid=9b0ef33925d3f78d3c7591c48ca1cce9&units=metric");
    currentWeatherResponse =
        CurrentWeatherResponse.fromJson(response.data);
    print(response.data);
    return currentWeatherResponse;
  } catch (e) {
    log(e.toString());
  }
  return null;
}

Future<HourlyWeatherResponse?> getHourlyData(context) async {
  HourlyWeatherResponse hourlyWeatherResponse;
  try {
    // final response = await http.get(Uri.parse(
    //     "http://api.openweathermap.org/data/2.5/forecast?lat=41.025152&lon=29.019159&appid=cd2a806afdcc70e043cc8c61241ab5e3&id=524901&units=metric"));
    final response = await _dio.get("forecast?lat=41.025152&lon=29.019159&appid=cd2a806afdcc70e043cc8c61241ab5e3&id=524901&units=metric");
    hourlyWeatherResponse =
        HourlyWeatherResponse.fromJson(response.data);
    print(response.data);
    return hourlyWeatherResponse;
  } catch (e) {
    log(e.toString());
  }
  return null;
}
