import 'package:flutter/material.dart';
import 'package:weather/services/weather_api_client.dart';

import '../models/weather_model.dart';
import '../widgets/additional_info_weather.dart';
import '../widgets/current_weather.dart';

class WeatherMainScreen extends StatefulWidget {
  const WeatherMainScreen({Key? key}) : super(key: key);

  @override
  State<WeatherMainScreen> createState() => _WeatherMainScreenState();
}

class _WeatherMainScreenState extends State<WeatherMainScreen> {
  WeatherApiClient client = WeatherApiClient();
  Weather? data = Weather();
  Future<void> getData() async {
    data = await client.getCurrentWeather("Barcelona");
  }

  @override
  Widget build(BuildContext context) {
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
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
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
