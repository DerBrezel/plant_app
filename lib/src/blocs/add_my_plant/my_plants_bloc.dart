import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:plant_app/src/model/plants.dart';
import 'package:plant_app/src/repository/plant_repository.dart';

part 'my_plants_event.dart';
part 'my_plants_state.dart';

class MyPlantsBloc extends Bloc<MyPlantsEvent, MyPlantsState> {
  final PlantRepository _plantRepository;

  MyPlantsBloc(this._plantRepository) : super(MyPlantsInitial());

  @override
  Stream<MyPlantsState> mapEventToState(
    MyPlantsEvent event,
  ) async* {
    if(event is GetMyPlants){
      try {
        yield MyPlantsLoading();
        final plant = await _plantRepository.fetchPlant(event.plants);
        yield MyPlantsLoaded(plant);
      } on NetworkException {
        yield MyPlantsError("Couldn't fetch Plant. Is this device online?");
      }
    }
  }
}
