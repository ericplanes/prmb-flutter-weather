import 'package:flutter/material.dart';
import 'package:weather/services/weather_api_client.dart';

import '../models/weather_model.dart';
import '../widgets/additional_info_weather.dart';
import '../widgets/current_weather.dart';
import 'city_list_screen.dart';

class WeatherMainScreen extends StatefulWidget {
  const WeatherMainScreen({Key? key}) : super(key: key);

  static String globalCityName = "Barcelona";

  @override
  State<WeatherMainScreen> createState() => _WeatherMainScreenState();
}

class _WeatherMainScreenState extends State<WeatherMainScreen> {
  WeatherApiClient client = WeatherApiClient();
  Weather? data = Weather();
  Future<void> getData({required String cityName}) async {
    if (cityName.isEmpty) cityName = WeatherMainScreen.globalCityName;
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
                              WeatherMainScreen.globalCityName =
                                  _cityController.text;
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
                const SizedBox(
                  height: 40.0,
                ),
                SizedBox(
                  width: 200.0,
                  child: RawMaterialButton(
                    fillColor: const Color(0xFF0069FE),
                    elevation: 0.0,
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ), // RoundedRectangleBorder
                    onPressed: () async {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => const CityListWeather()));
                    },
                    child: const Text(
                      "Show City List",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                      ),
                    ),
                  ),
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
