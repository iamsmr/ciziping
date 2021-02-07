
import 'dart:convert';

Directory directoryFromJson(String str) => Directory.fromJson(json.decode(str));

String directoryToJson(Directory data) => json.encode(data.toJson());

class Directory {
    Directory({
        this.sucess,
        this.count,
        this.data,
    });

    bool sucess;
    int count;
    List<Datum> data;

    factory Directory.fromJson(Map<String, dynamic> json) => Directory(
        sucess: json["sucess"],
        count: json["count"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "sucess": sucess,
        "count": count,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    Datum({
        this.id,
        this.user,
        this.name,
        this.notes,
        this.createdAt,
        this.updatedAt,
        this.v,
    });

    String id;
    User user;
    String name;
    List<Note> notes;
    DateTime createdAt;
    DateTime updatedAt;
    int v;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["_id"],
        user: User.fromJson(json["user"]),
        name: json["name"],
        notes: List<Note>.from(json["notes"].map((x) => Note.fromJson(x))),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "user": user.toJson(),
        "name": name,
        "notes": List<dynamic>.from(notes.map((x) => x.toJson())),
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
    };
}

class Note {
    Note({
        this.tags,
        this.id,
        this.title,
        this.content,
        this.createdAt,
        this.updatedAt,
    });

    List<String> tags;
    String id;
    String title;
    String content;
    DateTime createdAt;
    DateTime updatedAt;

    factory Note.fromJson(Map<String, dynamic> json) => Note(
        tags: List<String>.from(json["tags"].map((x) => x)),
        id: json["_id"],
        title: json["title"],
        content: json["content"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
    );

    Map<String, dynamic> toJson() => {
        "tags": List<dynamic>.from(tags.map((x) => x)),
        "_id": id,
        "title": title,
        "content": content,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
    };
}

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

    Map<String, dynamic> toJson() => {
        "_id": id,
        "fullName": fullName,
        "email": email,
    };
}
