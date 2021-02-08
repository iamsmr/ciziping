import 'dart:convert';

import 'package:ciziping/models/Error_response.dart';
import 'package:ciziping/models/Preferences.dart';
import 'package:ciziping/models/User/User_response.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class AuthService extends ChangeNotifier {
  UserResponse _user;
  User _currentUser;
  ErrorResponse _error;
  String _url = "http://localhost:5000/api/v1/users";

  UserResponse get user => _user;

  ErrorResponse get error => _error;

  User get currentUser => _currentUser;

  Future login(email, password) async {
    // print(email);
    // print(password);
    try {
      Response response = await http.post(
        "$_url/login",
        body: json.encode({
          "email": email,
          "password": password,
        }),
        headers: {"Content-Type": "application/json"},
      );
      if (response.statusCode == 200) {
        _user = userResponseFromString(response.body);
      }
      if (response.statusCode == 422) {
        _error = errorResponsefromString(response.body);
      }
      // print(response.body);
    } catch (e) {
      print(e);
    }
    notifyListeners();
  }

  Future register(fullName, email, password) async {
    // print(email);
    // print(password);
    try {
      Response response = await http.post(
        "$_url/register",
        body: json.encode({
          "email": email,
          "password": password,
          "fullName": fullName,
        }),
        headers: {"Content-Type": "application/json"},
      );
      if (response.statusCode == 200) {
        _user = userResponseFromString(response.body);
      }
      if (response.statusCode == 422) {
        _error = errorResponsefromString(response.body);
      }

      // print(response.body);
    } catch (e) {
      print(e);
    }

    notifyListeners();
  }

  Future getCurrentUser() async {
    try {
      Response response = await http.get("$_url/current", headers: {
        "Content-Type": "application/json",
        "x-auth-token": Preferences.prefs.getString("x-auth-token")
      });
      if (response.statusCode == 200) {
        _currentUser = userResponseFromString(response.body).user;
      }
    } catch (e) {
      print(e);
    }
    notifyListeners();
  }

  void clearError() {
    _error = null;
    notifyListeners();
  }

  void logout() {
    _user = null;
    notifyListeners();
  }
}
