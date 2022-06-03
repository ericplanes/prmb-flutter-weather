import 'package:flutter/material.dart';
import 'package:weather/services/weather_api_client.dart';

import '../models/weather_model.dart';
import '../widgets/additional_info_weather.dart';
import '../widgets/current_weather.dart';

String globalCityName = "Barcelona";

class WeatherMainScreen extends StatefulWidget {
  const WeatherMainScreen({Key? key}) : super(key: key);

  @override
  State<WeatherMainScreen> createState() => _WeatherMainScreenState();
}

class _WeatherMainScreenState extends State<WeatherMainScreen> {
  WeatherApiClient client = WeatherApiClient();
  Weather? data = Weather();
  Future<void> getData({required String cityName}) async {
    if (cityName.isEmpty) cityName = globalCityName;
    data = await client.getCurrentWeather(cityName);
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController _cityController = TextEditingController();
    return Scaffold(
      backgroundColor: const Color(0xFFf9f9f9),
      appBar: AppBar(
        backgroundColor: const Color(0xFFf9f9f9),
        elevation: 0.0,
        title: const Text(
          "Weather APP",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.menu),
          color: Colors.black,
        ),
      ),
      body: FutureBuilder(
        future: getData(cityName: _cityController.text),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 51,
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _cityController,
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.search),
                            hintText: "Search",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.0),
                                borderSide: BorderSide.none),
                            fillColor: const Color(0xFFE6E6EC),
                            filled: true,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFFE6E6EC),
                          borderRadius: BorderRadius.circular(9.0),
                        ),
                        child: IconButton(
                          icon: const Icon(Icons.done),
                          onPressed: () {
                            setState(() {
                              globalCityName = _cityController.text;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                currentWeather(
                  Icons.wb_sunny_rounded,
                  "Min: ${data?.tempMin}",
                  "Max: ${data?.tempMax}",
                  "${data?.temp}",
                  "${data?.cityName}",
                ),
                const SizedBox(
                  height: 20.0,
                ),
                const Text(
                  "Additional Information",
                  style: TextStyle(
                    fontSize: 24.0,
                    color: Color(0xdd212121),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Divider(),
                const SizedBox(
                  height: 20.0,
                ),
                additionalInformation(
                  "${data?.wind}",
                  "${data?.humidity}",
                  "${data?.pressure}",
                  "${data?.feelsLike}",
                ),
              ],
            );
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return Container();
        },
      ),
    );
  }
}
