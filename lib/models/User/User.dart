class User {
  User({
    this.id,
    this.fullName,
    this.email,
  });

  String id;
  String fullName;
  String email;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["_id"],
        fullName: json["fullName"],
        email: json["email"],
      );
}