import 'package:flutter/material.dart';
import 'package:weather/widgets/initial_page_buttons.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({Key? key}) : super(key: key);

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            "Weather APP",
            style: TextStyle(
              color: Colors.black,
              fontSize: 40.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 50.0,
          ),
          ButtonLogin(),
          SizedBox(
            height: 20.0,
          ),
          ButtonRegister(),
        ],
      ),
    );
  }
}
