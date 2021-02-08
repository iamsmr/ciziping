import 'package:ciziping/models/Preferences.dart';
import 'package:ciziping/screens/auth/authentication.dart';
import 'package:ciziping/screens/dashboard/dashboard.dart';
import 'package:ciziping/screens/landing/landing.dart';
import 'package:ciziping/services/auth_services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    if (authService.user != null) {
      Preferences.prefs.setString("x-auth-token", authService.user.user.token);
      Preferences.prefs.setString("uid", authService.user.user.uid);
      return Dashboard();
    } else {
      return Landing();
      // return Dashboard();
    }
  }
}
