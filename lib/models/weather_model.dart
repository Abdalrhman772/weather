import 'package:flutter/material.dart';

class WeatherModel {
  String weatherStateName;
  DateTime time;
  String locationName;
  double temp;
  double minTemp;
  double maxTemp;

  WeatherModel({
    required this.weatherStateName,
    required this.time,
    required this.temp,
    required this.minTemp,
    required this.maxTemp,
    required this.locationName,
  });

/* make a named constructor that is just responsible for construct
  the data from the internet, 
the keyword factory turns the named to a factory constructor that allow u to build 
  an object by the "return" statment, as the factory connstructor allow u to use
  the return statment */
  factory WeatherModel.fromJsonData(
      {required Map<String, dynamic> data, required String city}) {
    return WeatherModel(
      weatherStateName: data['weather_state_name'],
      time: DateTime.parse(data['created']),
      temp: data['the_temp'],
      minTemp: data['min_temp'],
      maxTemp: data['max_temp'],
      locationName: city,
    );
  }

  String getImage() {
    if (weatherStateName == 'Clear' || weatherStateName == 'Light Cloud') {
      return 'assets/images/clear.png';
    } else if (weatherStateName == 'Snow' ||
        weatherStateName == 'Hail' ||
        weatherStateName == 'Sleet') {
      return 'assets/images/snow.png';
    } else if (weatherStateName == 'Heavy Cloud') {
      return 'assets/images/cloudy.png';
    } else if (weatherStateName == 'Heavy Rain' ||
        weatherStateName == 'Light Rain' ||
        weatherStateName == 'Showers') {
      return 'assets/images/rainy.png';
    } else if (weatherStateName == 'Thunderstorm' ||
        weatherStateName == 'Thunder') {
      return 'assets/images/thunderstorm.png';
    }

    return 'assets/images/clear.png';
  }

  MaterialColor getColor() {
    if (weatherStateName == 'Clear' || weatherStateName == 'Light Cloud') {
      return Colors.blue;
    } else if (weatherStateName == 'Snow' ||
        weatherStateName == 'Hail' ||
        weatherStateName == 'Sleet') {
      return Colors.indigo;
    } else if (weatherStateName == 'Heavy Cloud') {
      return Colors.blueGrey;
    } else if (weatherStateName == 'Heavy Rain' ||
        weatherStateName == 'Light Rain' ||
        weatherStateName == 'Showers') {
      return Colors.blueGrey;
    } else if (weatherStateName == 'Thunderstorm' ||
        weatherStateName == 'Thunder') {
      return Colors.deepPurple;
    }

    return Colors.blue;
  }
}
