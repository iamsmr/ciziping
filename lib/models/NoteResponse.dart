import 'dart:convert';

NotesResponse notesResponseFromJson(String str) =>
    NotesResponse.fromJson(json.decode(str));

class NotesResponse {
  NotesResponse({
    this.sucess,
    this.data,
  });

  bool sucess;
  Data data;

  factory NotesResponse.fromJson(Map<String, dynamic> json) => NotesResponse(
        sucess: json["sucess"],
        data: Data.fromJson(json["data"]),
      );
}

class Data {
  Data({
    this.notes,
  });

  List<Note> notes;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        notes: List<Note>.from(json["notes"].map((x) => Note.fromJson(x))),
      );
}

class Note {
  Note({
    this.tags,
    this.id,
    this.content,
    this.createdAt,
    this.updatedAt,
  });

  List<String> tags;
  String id;
  String content;
  DateTime createdAt;
  DateTime updatedAt;

  factory Note.fromJson(Map<String, dynamic> json) => Note(
        tags: List<String>.from(json["tags"].map((x) => x)),
        id: json["_id"],
        content: json["content"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );
}
