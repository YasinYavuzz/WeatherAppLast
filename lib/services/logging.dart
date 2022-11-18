
import 'dart:developer';

import 'package:dio/dio.dart';

import '../providers/weather_provider.dart';
class Logging extends Interceptor{
  WeatherProvider? weatherProvider;
  HourlyWeatherProvider? hourlyWeatherProvider;
  int? statusCode;
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler){
    print("REQUEST ${options.method} => ${options.path}");

    return super.onRequest(options, handler);
  }

  // @override
  // void onRequest(RequestOptions options, RequestInterceptorHandler handler){
  //   print("REQUEST ${options.method} => ${options.path}");
  //   return super.onRequest(options, handler);
  // }
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler){
    // statusCode = response.statusCode;
    // getStatusCode(response.statusCode!);
    switch (response.statusCode) {
      case 200:
        // weatherProvider!.statusCode = 300;
        // print(weatherProvider!.response.clouds); 
        break;
      default:
    }
    print("RESPONSE ${response.statusCode} => ${response.requestOptions.path}");
    return super.onResponse(response, handler);
   
    //getStatusCode(response.statusCode!);
    // switch (response.statusCode) {
    //   case 200:
    //     weatherProvider!.getCurrentCheckStatusCode(response.statusCode!);
    //     hourlyWeatherProvider!.getHourlyCheckStatusCode(response.statusCode!);
    //     break;
    // }
    
  }

  // void getStatusCode(int? statusCode) {
  //   weatherProvider!.getCurrentCheckStatusCode(statusCode!);
  //   print(statusCode);
  //   weatherProvider!.getCurrentCheckStatusCode(statusCode);
  // }

}