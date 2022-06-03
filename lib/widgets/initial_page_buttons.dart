import 'package:flutter/material.dart';
import 'package:weather/screens/login_screen.dart';

import '../screens/register_screen.dart';

class ButtonLogin extends StatelessWidget {
  const ButtonLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SizedBox(
        width: double.infinity,
        child: RawMaterialButton(
          fillColor: const Color(0xFF0069FE),
          elevation: 0.0,
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          onPressed: () async {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const LoginScreen()));
          },
          child: const Text(
            "LogIn",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.0,
            ),
          ),
        ),
      ),
    );
  }
}

class ButtonRegister extends StatelessWidget {
  const ButtonRegister({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SizedBox(
        width: double.infinity,
        child: RawMaterialButton(
          fillColor: const Color(0xFF0069FE),
          elevation: 0.0,
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          onPressed: () async {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const RegisterScreen()));
          },
          child: const Text(
            "Register",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.0,
            ),
          ),
        ),
      ),
    );
  }
}
