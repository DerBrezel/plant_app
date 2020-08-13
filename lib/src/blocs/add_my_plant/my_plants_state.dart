part of 'my_plants_bloc.dart';

abstract class MyPlantsState {
  const MyPlantsState();
}

class MyPlantsInitial extends MyPlantsState {
  const MyPlantsInitial();
}

class MyPlantsLoading extends MyPlantsState{
  const MyPlantsLoading();
}

class MyPlantsLoaded extends MyPlantsState {
  final Plant plant;

  const MyPlantsLoaded(this.plant);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is MyPlantsLoaded && o.plant == plant;
  }

  @override
  int get hashCode => plant.hashCode;
}

class MyPlantsError extends MyPlantsState {
  final String message;
  const MyPlantsError(this.message);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is MyPlantsError && o.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}