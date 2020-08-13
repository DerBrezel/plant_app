import 'dart:math';
import '../model/plants.dart';

abstract class PlantRepository {
  Future<Plant> fetchPlant(String name);
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
}

class NetworkException implements Exception{}