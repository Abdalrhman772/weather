import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/providers/weather_provider.dart';
import 'package:weather_app/services/weather_service.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({Key? key}) : super(key: key);
  final searchController = TextEditingController();
  String? cityName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Search a City'),
        elevation: 0.0,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.blue,
              Colors.blue.shade300,
              Colors.blue.shade100,
              Colors.blue.shade50,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            TextFormField(
              onChanged: (value) => cityName = value,
              onFieldSubmitted: (value) async {
                cityName = value;
                //take an object from the weatherservice class which have the api
                WeatherService service = WeatherService();
                //then get this data and save at a weathermodel object to handle it
                WeatherModel? weather =
                    await service.getWeather(cityName: cityName!);
                /*then send the data u got "at the weather object" which is from the 
                  class weatherprovider which send it to materialapp at the provider to 
                    share it among other widgets, for example now u can use the weather 
                      u got here at the home screen */
                Provider.of<WeatherProvider?>(context, listen: false)
                    ?.weatherData = weather;
                Navigator.pop(context);
              },
              controller: searchController,
              keyboardType: TextInputType.text,
              cursorColor: Colors.white,
              style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w400,
                  color: Colors.white),
              decoration: InputDecoration(
                hintText: 'Enter a City',
                enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white)),
                focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white)),
                hintStyle: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                ),
                suffixIcon: IconButton(
                  onPressed: () async {
                    //take an object from the weatherservice class which have the api
                    WeatherService service = WeatherService();
                    //then get this data and save at a weathermodel object to handle it
                    WeatherModel? weather =
                        await service.getWeather(cityName: cityName!);
                    /*then send the data u got "at the weather object" which is from the 
                  class weatherprovider which send it to materialapp at the provider to 
                    share it among other widgets, for example now u can use the weather 
                      u got here at the home screen */
                    Provider.of<WeatherProvider?>(context, listen: false)
                        ?.weatherData = weather;
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.search_rounded,
                    color: Colors.white,
                    size: 36,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
