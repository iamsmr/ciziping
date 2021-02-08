import 'dart:convert';

import 'package:ciziping/models/User/User.dart';

DirectoryResponse directoryFromJson(String str) => DirectoryResponse.fromJson(json.decode(str));

class DirectoryResponse {
  DirectoryResponse({
    this.sucess,
    this.count,
    this.data,
  });

  bool sucess;
  int count;
  List<Directory> data;

  factory DirectoryResponse.fromJson(Map<String, dynamic> json) => DirectoryResponse(
        sucess: json["sucess"],
        count: json["count"],
        data: List<Directory>.from(json["data"].map((x) => Directory.fromJson(x))),
      );
}

class Directory {
  Directory({
    this.id,
    this.user,
    this.name,
    this.createdAt,
    this.updatedAt,
  });

  String id;
  User user;
  String name;
  DateTime createdAt;
  DateTime updatedAt;

  factory Directory.fromJson(Map<String, dynamic> json) => Directory(
        id: json["_id"],
        user: User.fromJson(json["user"]),
        name: json["name"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );
}


