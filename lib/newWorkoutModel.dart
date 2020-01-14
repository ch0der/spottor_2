// To parse this JSON data, do
//
//     final exercise = exerciseFromJson(jsonString);

import 'dart:convert';

Exercise exerciseFromJson(String str) => Exercise.fromJson(json.decode(str));

String exerciseToJson(Exercise data) => json.encode(data.toJson());

class Exercise {
  int id;
  String bodyPart;
  String nickname;
  String exercise;
  String equipment;
  String position;
  String grip;
  String incline;
  String note;
  String weight;
  String weight2;
  String sets;
  String reps;
  bool lbs;

  Exercise({
    this.id,
    this.bodyPart,
    this.nickname,
    this.exercise,
    this.equipment,
    this.position,
    this.grip,
    this.incline,
    this.note,
    this.weight,
    this.weight2,
    this.sets,
    this.reps,
    this.lbs,
  });

  factory Exercise.fromJson(Map<String, dynamic> json) => Exercise(
    id: json["id"],
    bodyPart: json["bodyPart"],
    nickname: json["nickname"],
    exercise: json["exercise"],
    equipment: json["equipment"],
    position: json["position"],
    grip: json["grip"],
    incline: json["incline"],
    note: json["note"],
    weight: json["weight"],
    weight2: json["weight2"],
    sets: json["sets"],
    reps: json["reps"],
    lbs: json["lbs"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "bodyPart": bodyPart,
    "nickname": nickname,
    "exercise": exercise,
    "equipment": equipment,
    "position": position,
    "grip": grip,
    "incline": incline,
    "note": note,
    "weight": weight,
    "weight2": weight2,
    "sets": sets,
    "reps": reps,
    "lbs": lbs,
  };
}