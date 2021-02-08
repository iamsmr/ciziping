import 'package:ciziping/models/Preferences.dart';
import 'package:ciziping/screens/dashboard/dashboard.dart';
import 'package:ciziping/services/auth_services/auth_service.dart';
import 'package:ciziping/services/directory_services/directory_services.dart';
import 'package:ciziping/services/themeServices/theme.dart';
import 'package:ciziping/wrapper.dart';
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
        ChangeNotifierProvider<ChangeTheme>.value(value: ChangeTheme()),
        ChangeNotifierProvider<AuthService>.value(value: AuthService()),
        ChangeNotifierProvider<DirectoryServices>.value(
          value: DirectoryServices(),
        )
      ],
      child: Consumer<ChangeTheme>(
        builder: (context, changeTheme, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: changeTheme.themeData,
            home: Wrapper(),
            // home: Dashboard(),
          );
        },
      ),
    );
  }
}
