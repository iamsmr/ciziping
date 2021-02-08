import 'dart:convert';

ErrorResponse errorResponsefromString(String str) =>
    ErrorResponse.fromJson(json.decode(str));

class ErrorResponse {
  ErrorResponse({
    this.sucess,
    this.error,
  });

  bool sucess;
  Error error;

  factory ErrorResponse.fromJson(Map<String, dynamic> json) => ErrorResponse(
        sucess: json["sucess"],
        error: Error.fromJson(json["error"]),
      );
}

class Error {
  Error({
    this.message,
  });

  String message;

  factory Error.fromJson(Map<String, dynamic> json) => Error(
        message: json["message"],
      );
}
