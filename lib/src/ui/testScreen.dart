
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plant_app/src/blocs/add_my_plant/my_plants_bloc.dart';
import 'package:plant_app/src/model/plants.dart';
import 'package:plant_app/src/ui/CustomWidgets.dart';

class TestScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MainScreenState();
  }
}
class _MainScreenState extends State<TestScreen>{
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(title: Text("Home"),),
      body: Container(
        margin: const EdgeInsets.all(8),
        alignment: Alignment.center,
        child: BlocConsumer<MyPlantsBloc, MyPlantsState>(
          listener: (context, state){
            if (state is MyPlantsError) {
              Scaffold.of(context).showSnackBar(SnackBar(content: Text(state.message),));
            }
          },
          builder: (context, state) {
            if (state is MyPlantsInitial){
              return buildInitialInput();
            } else if (state is MyPlantsLoading){
             return buildLoading();
            } else if (state is MyPlantsLoaded) {
              return buildColumnWithData(state.plant);
            } else if(state is AllPlantsLoaded){
              return buildAllPlants(state.plants);
            }else {
              // (state is MyPlantError)
              return buildInitialInput();
            }
          },
        )
      ),
    );
  }
  Widget buildInitialInput(){
    return Center(
      child: Column(
        children: <Widget>[
          PlantInputField(),
          FlatButton(
            onPressed: () {BlocProvider.of<MyPlantsBloc>(context).add(GetAllPlants());},
            child: Text("Show all plants"),
          )
        ],
      ),
    );
  }

  //shows the dummy plants.
  Widget buildAllPlants(List<Plant> allPlants) {
    return Column(
      children: <Widget>[
        PlantInputField(),
        Expanded(
          child: ListView.builder(
            itemCount: allPlants.length,
              itemBuilder: (context, index){
            return Container(
              height: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
              ),
              child: FlatButton(
                onPressed: () {BlocProvider.of<MyPlantsBloc>(context).add(AddToMyPlants(allPlants[index]));},
                  child: Text(allPlants[index].name)),
            );
          }),
        ),
      ],
    );
  }

  Widget buildLoading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Column buildColumnWithData(Plant plant) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Text(plant.name),
        Text("Plant watering needed ${plant.waterValue}"),
        buildInitialInput(),
      ],
    );
  }
}

class PlantInputField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: TextField(
        onSubmitted: (value) => submitPlantName(context, value),
        textInputAction: TextInputAction.search,
        decoration: InputDecoration(
          hintText: "Enter a plant",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          suffixIcon: Icon(Icons.search),
        ),
      ),
    );
  }

  void submitPlantName(BuildContext context, String plant){
    BlocProvider.of<MyPlantsBloc>(context).add(GetPlant(plant));
  }
}
