
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

@immutable
abstract class MyPlantState extends Equatable {
  final String name;
  final DateTime watered;

  const MyPlantState(this.name, this.watered);
}

class InitialMyPlantState extends MyPlantState {
  InitialMyPlantState(String name, DateTime watered) : super(name, watered);

  @override
  List<Object> get props => [name, watered];
}