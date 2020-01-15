import 'dart:async';
import 'dart:io';
import 'newWorkoutModel.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

class DBProvider {
  DBProvider._();
  static final DBProvider db = DBProvider._();

  Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await initDB();
    return _database;
  }

  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "DB.db");
    return await openDatabase(
      path,
      version: 1,
      onOpen: (db) {},
      onCreate: (Database db, int version) async {
        await db.execute("CREATE TABLE Exercise ("
            "id INTEGER PRIMARY KEY,"
            "bodypart TEXT,"
            "nickname TEXT,"
            "exercise TEXT,"
            "equipment TEXT,"
            "position TEXT,"
            "grip TEXT,"
            "incline TEXT,"
            "weight INTEGER,"
            "weight2 INTEGER,"
            "sets INTEGER,"
            "sets2 INTEGER,"
            "reps INTEGER,"
            "reps2 INTEGER,"
            "lbs BIT"
            ")");
      },
    );
  }

  newExercise(Exercise newExercise)async{
    final db = await database;
    var table = await db.rawQuery("SELECT MAX(id)+1 as id FROM Exercise");
    int id = table.first["id"];
    var raw = await db.rawInsert("INSERT into Exercise (id,bodypart,nickname,exercise,equipment,position,grip,incline,weight,weight2,sets,sets2,reps,reps2,lbs)"
        " VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)",
        [id, newExercise.bodyPart, newExercise.nickname,newExercise.exercise,newExercise.equipment,newExercise.position,newExercise.grip,newExercise.incline,
          newExercise.weight,newExercise.weight2,newExercise.sets,newExercise.sets2,newExercise.reps,newExercise.reps2,newExercise.lbs]
    );

    return raw;
  }
}
