import 'package:flutter/material.dart';

import '../screens/weather_main_screen.dart';

TextStyle normalFont =
    const TextStyle(fontWeight: FontWeight.w600, fontSize: 18.0);

TextStyle tempFont =
    const TextStyle(fontWeight: FontWeight.w400, fontSize: 18.0);

Widget listElement(BuildContext context, String cityName, String temp) {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.all(18.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 51,
          child: Row(
            children: [
              Expanded(
                child: Text(
                  cityName,
                  style: normalFont,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Text(
                  temp,
                  style: tempFont,
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
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    globalCityName = cityName;
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => const WeatherMainScreen()));
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
