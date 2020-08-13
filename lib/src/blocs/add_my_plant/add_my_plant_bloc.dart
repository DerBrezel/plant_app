
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plant_app/src/blocs/add_my_plant/add_my_plant_event.dart';
import 'package:plant_app/src/blocs/add_my_plant/add_my_plant_state.dart';

class MyPlantBloc extends Bloc<MyPlantEvent, MyPlantState>{

  List<MyPlantState> currentPlants;
  List<DummyPlants> searchPlants = DummyData().dummySearchPlants;

  @override
  MyPlantState get initialState => InitialMyPlantState("NoName", DateTime.now());

  @override
  Stream<MyPlantState> mapEventToState(MyPlantEvent event) async* {
    if (event is NamingEvent){
      yield (InitialMyPlantState(event.name, state.watered));
    } else if (event is WateringEvent){
      yield (InitialMyPlantState(state.name, event.watered));
    }
  }

}

class DummyPlants{
  String name;
  DateTime watered;
  DummyPlants(this.name, this.watered);
}

class DummyData {
  List<DummyPlants> dummySearchPlants = [
    DummyPlants("Arugula", DateTime.now()),
    DummyPlants("Monstera", DateTime.now().subtract(Duration(days: 3))),
    DummyPlants("Basil", DateTime.now().subtract(Duration(days: 2))),
    DummyPlants("Cactus", DateTime.now().subtract(Duration(days: 5))),
    DummyPlants("Mint", DateTime.now().subtract(Duration(days: 10))),
  ];
}