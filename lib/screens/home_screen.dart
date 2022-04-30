import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/providers/weather_provider.dart';
import 'package:weather_app/screens/search_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var weatherProv = Provider.of<WeatherProvider>(context).weatherData;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          'Weather',
          style: TextStyle(fontSize: 28),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: IconButton(
              onPressed: () {
                Navigator.push(
                  (context),
                  MaterialPageRoute(
                    builder: (context) => SearchScreen(),
                  ),
                );
              },
              icon: const Icon(
                Icons.search_rounded,
                size: 35,
              ),
            ),
          ),
        ],
      ),
      body: weatherProv == null
          ? Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'there is no weather 😔 start ',
                    style: TextStyle(fontSize: 30),
                  ),
                  Text(
                    'searching now 🔍',
                    style: TextStyle(fontSize: 30),
                  ),
                ],
              ),
            )
          //in case of else
          : Container(
              padding: const EdgeInsets.only(top: 60),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    weatherProv.getColor(),
                    weatherProv.getColor().shade100,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Column(
                children: [
                  Text(
                    weatherProv.locationName,
                    style: const TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'updated  ${weatherProv.time.hour}:${weatherProv.time.second}',
                    style: const TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(
                        weatherProv.getImage(),
                      ),
                      Text(
                        '${weatherProv.temp.toInt()}',
                        style: const TextStyle(
                          fontSize: 60,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Max temp : ${weatherProv.maxTemp.toInt()}',
                            style: const TextStyle(
                              fontSize: 17,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            'Min temp  : ${weatherProv.minTemp.toInt()}',
                            style: const TextStyle(
                              fontSize: 17,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  Text(
                    weatherProv.weatherStateName,
                    style: const TextStyle(
                      fontSize: 34,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
