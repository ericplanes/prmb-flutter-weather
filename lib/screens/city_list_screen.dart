import 'package:flutter/material.dart';
import 'package:weather/screens/weather_main_screen.dart';

import '../models/weather_model.dart';
import '../services/weather_api_client.dart';
import '../widgets/list_element_weather.dart';

class CityListWeather extends StatefulWidget {
  const CityListWeather({Key? key}) : super(key: key);

  @override
  State<CityListWeather> createState() => _CityListWeatherState();
}

class _CityListWeatherState extends State<CityListWeather> {
  WeatherApiClient client = WeatherApiClient();
  Weather? data = Weather();
  Weather? data2 = Weather();
  Weather? data3 = Weather();
  Weather? data4 = Weather();
  Weather? data5 = Weather();
  Future<void> getData({required String cityName}) async {
    if (cityName.isEmpty) cityName = WeatherMainScreen.globalCityName;
    data = await client.getCurrentWeather(cityName);
    data2 = await client.getCurrentWeather("Berlin");
    data3 = await client.getCurrentWeather("Londres");
    data4 = await client.getCurrentWeather("Paris");
    data5 = await client.getCurrentWeather("Tokio");
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
                listElement(
                  context,
                  "${data?.cityName}",
                  "${data?.temp} °C",
                ),
                listElement(
                  context,
                  "${data2?.cityName}",
                  "${data2?.temp} °C",
                ),
                listElement(
                  context,
                  "${data3?.cityName}",
                  "${data3?.temp} °C",
                ),
                listElement(
                  context,
                  "${data4?.cityName}",
                  "${data4?.temp} °C",
                ),
                listElement(
                  context,
                  "${data5?.cityName}",
                  "${data5?.temp} °C",
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
