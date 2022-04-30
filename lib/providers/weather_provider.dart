import 'package:flutter/cupertino.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherProvider extends ChangeNotifier {
  /*put here the objects u wanna share it with other widgets,
    here we wanna share the data of the weathermodel so the objects 
      can access it's data */
  WeatherModel? _weatherData;

  set weatherData(WeatherModel? weather) {
    _weatherData = weather;
    notifyListeners();
  }

  WeatherModel? get weatherData => _weatherData;
}
