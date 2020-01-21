import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'package:spottor_2/newWorkoutModel.dart';
import 'package:spottor_2/workoutDB.dart';

class ExerciseBloc{

  final _exerciseController = StreamController<List<Exercise>>.broadcast();
  final _workoutName = BehaviorSubject<String>();
  final _bodyPartName = BehaviorSubject<String>();
  final _weightLow = BehaviorSubject<int>();

  Stream<String> get workoutName => _workoutName.stream;
  Stream<String> get bodypartName => _bodyPartName.stream;
  Stream<int> get weightLow => _weightLow.stream;

  get exerciseAll => _exerciseController.stream;

  Function(String)get addWorkoutName => _workoutName.sink.add;
  Function(String)get addBodyPartName => _bodyPartName.sink.add;
  Function(int)get addWeightLow => _weightLow.sink.add;

  dispose(){
    _exerciseController.close();
    _weightLow.close();
    _bodyPartName.close();
    _workoutName.close();
  }
  ExerciseBloc(){
    fetchExercise();
  }
  fetchExercise()async{
    final ids = await DBProvider.db.getAllExercises();
    _exerciseController.add(ids);
  }
  delete(int id){
    DBProvider.db.deleteExercise(id);
    fetchExercise();
  }
  addExercise(Exercise exercise){
    DBProvider.db.newExercise(exercise);
    fetchExercise();
  }


}

class ExerciseBloc2{
  final _clientController = StreamController<List<Exercise>>.broadcast();

  get exercises => _clientController.stream;

  dispose() {
    _clientController.close();
  }

  getClients() async {
    _clientController.sink.add(await DBProvider.db.getAllExercises());
  }

  ExerciseBloc2() {
    getClients();
  }


  delete(int id) {
    DBProvider.db.deleteExercise(id);
    getClients();
  }

  add(Exercise exercise) {
    DBProvider.db.newExercise(exercise);
    getClients();
  }

}