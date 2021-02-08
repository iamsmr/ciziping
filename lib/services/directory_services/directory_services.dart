import 'dart:convert';

import 'package:ciziping/models/Error_response.dart';
import 'package:ciziping/models/NoteResponse.dart';
import 'package:ciziping/models/Preferences.dart';
import 'package:ciziping/models/directory.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class DirectoryServices extends ChangeNotifier {
  String _url = "http://localhost:5000/api/v1/directory";
  String token = Preferences.prefs.getString("x-auth-token");
  DirectoryResponse _directory;
  ErrorResponse _errorResponse;
  NotesResponse _notesResponse;

  DirectoryResponse get directory => _directory;
  ErrorResponse get errorResponse => _errorResponse;
  NotesResponse get notesResponse => _notesResponse;

  Future getALlDirectory() async {
    try {
      Response response = await http.get(_url, headers: {
        'Content-Type': 'application/json',
        'x-auth-token': token,
      });
      if (response.statusCode == 200) {
        _directory = directoryFromJson(response.body);
      }
      if (response.statusCode == 422) {
        _errorResponse = errorResponsefromString(response.body);
      }
      // print(response.body);
    } catch (e) {
      print(e);
    }
    notifyListeners();
  }

  Future createNewDirectory(userID, directoryName) async {
    try {
      print(userID);
      print(directoryName);
      Response response = await http.post(
        _url,
        body: json.encode({
          "user": userID,
          "name": directoryName,
        }),
        headers: {
          'Content-Type': 'application/json',
          'x-auth-token': token,
        },
      );
      final data = json.decode(response.body);

      if (response.statusCode == 200) {
        _directory = directoryFromJson(response.body);
      }
      if (data["sucess"] == false) {
        _errorResponse = errorResponsefromString(response.body);
      }
      // print(response.body);
    } catch (e) {
      print(e);
    }
    notifyListeners();
  }

  Future updateDirectory(directoryId, userID, newName) async {
    try {
      Response response = await http.put(
        "$_url/$directoryId",
        body: json.encode({"name": newName}),
        headers: {
          'Content-Type': 'application/json',
          'x-auth-token': token,
        },
      );
      final data = json.decode(response.body);

      if (response.statusCode == 200) {
        _directory = directoryFromJson(response.body);
      }
      if (data["sucess"] == false) {
        _errorResponse = errorResponsefromString(response.body);
      }
      // print(response.body);
    } catch (e) {
      print(e);
    }
    notifyListeners();
  }

  Future deleteDirectory(directoryId) async {
    print(directoryId);
    try {
      Response response = await http.delete(
        "$_url/$directoryId",
        headers: {
          'Content-Type': 'application/json',
          'x-auth-token': token,
        },
      );

      print(response.body);
    } catch (e) {
      print(e);
    }
    notifyListeners();
  }

  Future getNotes(directoryId) async {
    try {
      Response response = await http.get(
        "$_url/$directoryId/notes",
        headers: {
          'Content-Type': 'application/json',
          'x-auth-token': token,
        },
      );
      if (response.statusCode == 200) {
        _notesResponse = notesResponseFromJson(response.body);
      }
      print(response.body);
    } catch (e) {}
    notifyListeners();
  }

  Future createNote(content, tags, directoryId) async {
    try {
      Response response = await http.post(
        "$_url/$directoryId/notes",
        body: json.encode({
          "content": content,
          "tags": tags,
        }),
        headers: {
          'Content-Type': 'application/json',
          'x-auth-token': token,
        },
      );
      print(response.body);
    } catch (e) {}
    notifyListeners();
  }

  Future deleteNote(directoryId, noteId) async {
    try {
      Response response = await http.delete(
        "$_url/$directoryId/notes/$noteId",
        headers: {
          'Content-Type': 'application/json',
          'x-auth-token': token,
        },
      );
      print(response.body);
    } catch (e) {}
    notifyListeners();
  }
}
