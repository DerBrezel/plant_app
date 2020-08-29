part of 'my_plants_bloc.dart';

abstract class MyPlantsEvent {}

class GetPlant extends MyPlantsEvent {
  final String plants;

  GetPlant(this.plants);
}

class GetAllPlants extends MyPlantsEvent {
}

class AddToMyPlants extends MyPlantsEvent {
  final Plant plant;
  AddToMyPlants(this.plant);
}