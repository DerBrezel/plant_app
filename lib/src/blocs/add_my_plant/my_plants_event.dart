part of 'my_plants_bloc.dart';

abstract class MyPlantsEvent {}

class GetMyPlants extends MyPlantsEvent {
  final String plants;

  GetMyPlants(this.plants);
}

class GetAllPlants extends MyPlantsEvent {
}