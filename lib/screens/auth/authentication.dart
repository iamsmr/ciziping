import 'package:ciziping/screens/auth/login.dart';
import 'package:ciziping/screens/auth/register.dart';
import 'package:flutter/material.dart';

class Authentication extends StatefulWidget {
  @override
  _AuthenticationState createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
  bool switchScreen = false;
  void toggleScreen() {
    setState(() {
      switchScreen = !switchScreen;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!switchScreen) {
      return Login(toggleScreen: toggleScreen);
    }
    return Register(toggleScreen: toggleScreen);
  }
}
