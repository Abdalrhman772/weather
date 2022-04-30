import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/providers/weather_provider.dart';
import 'package:weather_app/screens/home_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => WeatherProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var weatherProv = Provider.of<WeatherProvider>(context).weatherData;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
      theme: ThemeData(
        primarySwatch:
            weatherProv == null ? Colors.blue : weatherProv.getColor(),
      ),
    );
  }
}
