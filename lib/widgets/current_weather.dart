import 'dart:math';

import 'package:flutter/material.dart';

Icon getWeatherIcon() {
  Random random = new Random();
  int randomNumber = random.nextInt(3);
  switch (randomNumber) {
    case 0:
      return const Icon(
        Icons.wb_cloudy_rounded,
        color: Colors.grey,
        size: 64.0,
      );
    case 1:
      return const Icon(
        Icons.cloudy_snowing,
        color: Colors.lightBlueAccent,
        size: 64.0,
      );
  }
  return const Icon(
    Icons.wb_sunny_rounded,
    color: Colors.orange,
    size: 64.0,
  );
}

Widget currentWeather(
    String tempMin, String tempMax, String temp, String location) {
  return Center(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        getWeatherIcon(),
        Text(
          location,
          style: const TextStyle(
            fontSize: 50.0,
            color: Color(0xFF5a5a5a),
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
        Text(
          tempMin,
          style: const TextStyle(
            fontSize: 18.0,
          ),
        ),
        Text(
          temp,
          style: const TextStyle(
            fontSize: 46.0,
          ),
        ),
        Text(
          tempMax,
          style: const TextStyle(
            fontSize: 18.0,
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
      ],
    ),
  );
}
