import 'package:flutter/cupertino.dart';
import 'package:weather_ui/models/current_weather_response.dart';
import 'package:weather_ui/models/hourly_weather_response.dart';
import 'package:weather_ui/services/apiServices.dart';

class WeatherProvider extends ChangeNotifier {
  CurrentWeatherResponse response = CurrentWeatherResponse();
  //bool isLoading = false;

  getWeatherData(context) async {
    response = (await getCurrentData(context))!;
    notifyListeners();
  }
}

class HourlyWeatherProvider extends ChangeNotifier {
  HourlyWeatherResponse hourlyWeatherResponse = HourlyWeatherResponse();
  int? index;

  
  getHourlyWeatherData(context) async {
    
    hourlyWeatherResponse = (await getHourlyData(context))!;
    notifyListeners();
  }

  getChangeIndex(int index) async {
    this.index = index;
    notifyListeners();
  }
}
