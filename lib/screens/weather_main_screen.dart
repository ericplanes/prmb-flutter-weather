import 'package:flutter/material.dart';
import 'package:weather/widgets/additional_info_weather.dart';
import 'package:weather/widgets/current_weather.dart';

class WeatherMainScreen extends StatefulWidget {
  const WeatherMainScreen({Key? key}) : super(key: key);

  @override
  State<WeatherMainScreen> createState() => _WeatherMainScreenState();
}

class _WeatherMainScreenState extends State<WeatherMainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFf9f9f9),
      appBar: AppBar(
        backgroundColor: Color(0xFFf9f9f9),
        elevation: 0.0,
        title: const Text(
          "Weather APP",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.menu),
          color: Colors.black,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          currentWeather(Icons.wb_sunny_rounded, "26.3", "Georgia"),
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
          Divider(),
          SizedBox(
            height: 20.0,
          ),
          additionalInformation("24", "2", "1014", "24.6"),
        ],
      ),
    );
  }
}
