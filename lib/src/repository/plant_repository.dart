import 'dart:math';
import '../model/plants.dart';

abstract class PlantRepository {
  Future<Plant> fetchPlant(String name);
  Future<List<Plant>> fetchAllPlants();

  Future<List<Plant>> fetchAllMyPlants();
  Future<Plant> fetchMyPlant(String name);
  void addToMyPlants(Plant plant);
}

class FakePlantRepository implements PlantRepository{
  @override
  Future<Plant> fetchPlant(String name) {
    //simulate network delay
    return Future.delayed(Duration(seconds: 1), () { final random = Random();
    if (random.nextBool()) {
      throw NetworkException();
    }
    //return "fetched" plant
    return Plant(name: name, waterValue: random.nextInt(31).toDouble());
  },
    );
    }

    @override
    Future<List<Plant>> fetchAllPlants() {
    return Future.delayed(Duration(seconds: 1), () {
      return DummyData().dummyPlants;
    });

    }
    @override
    Future<List<Plant>> fetchAllMyPlants(){
      return Future.delayed(Duration(seconds: 0), () {
        return DummyData().myDummyPlants;
      });
    }

    @override
    Future<Plant> fetchMyPlant(String name){
      return Future.delayed(Duration(seconds: 0), () {
      //return first "fetched" plant eventually add an id so name can be doubled.
      return DummyData().myDummyPlants.where((element) => element.name == name).first;
      },
      );
    }

    @override
    void addToMyPlants(Plant plant) {
    DummyData().myDummyPlants.add(plant);
  }
}

class NetworkException implements Exception{}

class DummyData{
  List<Plant> dummyPlants = [
    Plant(name: "Arugula", waterValue: 21),
    Plant(name: "Monstera", waterValue: 3),
    Plant(name: "Frugula", waterValue: 4),
    Plant(name: "Parsil", waterValue: 1),
    Plant(name: "Basil", waterValue: 30),
    Plant(name: "Mint", waterValue: 11),
    Plant(name: "Ivy", waterValue: 2),
    Plant(name: "Cactus", waterValue: 7),
    Plant(name: "Arbol", waterValue: 6),
    Plant(name: "Conanstiaza", waterValue: 12),

  ];


  List<Plant> myDummyPlants = [
    Plant(name: "Cactus", waterValue: 7),
    Plant(name: "Arbol", waterValue: 6),
    Plant(name: "Conanstiaza", waterValue: 12),
  ];
}