
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

@immutable
abstract class MyPlantEvent extends Equatable{}

class NamingEvent extends MyPlantEvent{
  final String name;
  NamingEvent(this.name);

  @override
  List<Object> get props => [name];
}

class WateringEvent extends MyPlantEvent{
  final DateTime watered;
  WateringEvent(this.watered);

  @override
  List<Object> get props => [watered];
}