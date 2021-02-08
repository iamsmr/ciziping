import 'dart:convert';

UserResponse userResponseFromString(String str) =>
    UserResponse.fromJson(json.decode(str));

class UserResponse {
  UserResponse({
    this.sucess,
    this.user,
  });

  bool sucess;
  User user;

  factory UserResponse.fromJson(Map<String, dynamic> json) => UserResponse(
        sucess: json["sucess"],
        user: User.fromJson(json["user"]),
      );
}

class User {
  User({
    this.uid,
    this.fullName,
    this.email,
    this.token,
  });

  String uid;
  String fullName;
  String email;
  String token;

  factory User.fromJson(Map<String, dynamic> json) => User(
        uid: json["uid"],
        fullName: json["fullName"],
        email: json["email"],
        token: json["token"],
      );
}
