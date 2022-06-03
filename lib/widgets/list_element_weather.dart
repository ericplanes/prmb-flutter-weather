import 'package:flutter/cupertino.dart';

TextStyle normalFont =
    const TextStyle(fontWeight: FontWeight.w600, fontSize: 18.0);

TextStyle tempFont =
    const TextStyle(fontWeight: FontWeight.w400, fontSize: 18.0);

Widget listElement(String cityName, String temp) {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.all(18.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  cityName,
                  style: normalFont,
                ),
                const SizedBox(
                  height: 18.0,
                ),
                Text(
                  temp,
                  style: tempFont,
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  );
}
