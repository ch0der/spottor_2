// To parse this JSON data, do
//
//     final exercise = exerciseFromJson(jsonString);

import 'dart:convert';

Exercise exerciseFromJson(String str) {
  final jsonData = json.decode(str);
  return Exercise.fromMap(jsonData);
}

String exerciseToJson(Exercise data) {
  final dyn = data.toMap();
  return json.encode(dyn);
}
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
  int weight;
  String weight2;
  String sets;
  String sets2;
  String reps;
  String reps2;
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
    this.sets2,
    this.reps,
    this.reps2,
    this.lbs,
  });

  factory Exercise.fromMap(Map<String, dynamic> json) => Exercise(
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
    sets2: json["sets2"],
    reps: json["reps"],
    reps2: json["reps2"],
    lbs: json["lbs"] == 1,
  );

  Map<String, dynamic> toMap() => {
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
    "sets2": sets2,
    "reps": reps,
    "reps2": reps2,
    "lbs": lbs,
  };
}
