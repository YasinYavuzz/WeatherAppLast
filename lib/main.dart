import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_ui/pages/home_screen.dart';
import 'package:weather_ui/providers/weather_provider.dart';

void main() {
  // Burasıda sarılabilir. MultiProvider ile
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<WeatherProvider>(
        create: (_) => WeatherProvider(),
      ),
      ChangeNotifierProvider<HourlyWeatherProvider>(
        create: (_) => HourlyWeatherProvider(),
      )
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreen());
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
