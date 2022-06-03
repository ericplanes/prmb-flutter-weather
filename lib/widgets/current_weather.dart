import 'package:flutter/material.dart';

Widget currentWeather(IconData icon, String tempMin, String tempMax,
    String temp, String location) {
  return Center(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: Colors.orange,
          size: 64.0,
        ),
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
