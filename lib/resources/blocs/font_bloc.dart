import 'dart:async';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FontBloc{
 final _font = BehaviorSubject<String>();

 Stream<String> get font => _font.stream;

 dispose(){
  _font.close();
 }

 FontBloc(){
  getFont();
 }

 Future getFont()async{
  final prefs = await SharedPreferences.getInstance();
  final font = prefs.getString('font');

  _font.sink.add(font);
 }





}