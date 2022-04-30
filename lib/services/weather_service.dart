import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/models/weather_model.dart';

class WeatherService {
  String baseUrl = 'https://www.metaweather.com';

  /* we split it into 2 methods (as it's not a good practice to make a method that do more than one function)
    so first method would get the id , then the second one will use this id to get the weather */

  // search for a location
  Future<int> getCityID({required String cityName}) async {
    Uri url = Uri.parse('$baseUrl//api/location/search/?query=$cityName');
    http.Response response = await http.get(url);
    List<dynamic> wData = jsonDecode(response.body);
    int cityId = wData[0]['woeid'];
    return cityId;
  }

  // use the location to get its weather
  Future<WeatherModel?> getWeather({required String cityName}) async {
    WeatherModel? weatherData;
    try {
      int id = await getCityID(cityName: cityName);
      Uri url = Uri.parse('$baseUrl/api/location/$id');

      http.Response response = await http.get(url);

      Map<String, dynamic> data = jsonDecode(response.body);

      /*from the data i will get the first map as this is what i need to show it (check the website)
     and from this map i need to acess the first object of it (day 1 weather) */
      Map<String, dynamic> fDayWeather = data['consolidated_weather'][0];
      String locationName = data['title'];
      weatherData =
          WeatherModel.fromJsonData(data: fDayWeather, city: locationName);
    } catch (e) {
      print(' hello there i\'m the error $e');
    }
    return weatherData;
  }
}
