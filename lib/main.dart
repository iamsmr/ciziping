
import 'package:ciziping/models/Preferences.dart';
import 'package:ciziping/screens/auth/authentication.dart';
import 'package:ciziping/screens/auth/login.dart';
import 'package:ciziping/screens/dashboard/dashboard.dart';
import 'package:ciziping/screens/dashboard/inside_folder.dart';
import 'package:ciziping/screens/landing/landing.dart';
import 'package:ciziping/services/themeServices/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Preferences.prefs = await SharedPreferences.getInstance();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ChangeTheme>.value(
          value: ChangeTheme(),
        ),
      ],
      child: Consumer<ChangeTheme>(
        builder: (context, changeTheme, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: changeTheme.themeData,
            home: Landing(),
            // home: Dashboard(),
            // home: Login(),
            // home: Authentication(),
            // home:InsideFolder(),
          );
        },
      ),
    );
  }
}
