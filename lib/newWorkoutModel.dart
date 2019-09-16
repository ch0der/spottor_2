// To parse this JSON data, do
//
//     final workout = workoutFromJson(jsonString);

import 'dart:convert';

Workout workoutFromJson(String str) => Workout.fromJson(json.decode(str));

String workoutToJson(Workout data) => json.encode(data.toJson());

class Workout {
  int id;
  String category;
  String name;
  String description;
  String note;

  Workout({
    this.id,
    this.category,
    this.name,
    this.description,
    this.note,
  });

  factory Workout.fromJson(Map<String, dynamic> json) => Workout(
    id: json["id"],
    category: json["category"],
    name: json["name"],
    description: json["description"],
    note: json["note"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "category": category,
    "name": name,
    "description": description,
    "note": note,
  };
}
