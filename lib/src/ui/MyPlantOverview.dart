import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plant_app/src/model/plants.dart';
import 'package:plant_app/src/repository/plant_repository.dart';
import 'package:plant_app/src/ui/CustomWidgets.dart';

class MyPlantOverview extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyPlantOverviewState();
  }
}

class _MyPlantOverviewState extends State<MyPlantOverview> {
  List<Plant> plants = DummyData().dummyPlants;
  String title = "The Garden";
  int _currentIndex = 0;

  List cardList = [1,2,3,4];

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Center(
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [const Color(0xFFE6E7EB), const Color(0xFFBFD6E7)],
            tileMode: TileMode.repeated,
          )),
          child: Column(
            children: <Widget>[
              PlantsRoom(plants, title),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: map<Widget>(cardList, (index, url) {
                  return Container(
                    width: 10.0,
                    height: 10.0,
                    margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _currentIndex == index ? Colors.blueAccent : Colors.grey,
                    ),
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PlantsRoom extends StatelessWidget{
  final List<Plant> plants;
  final String title;

  PlantsRoom(this.plants, this.title);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(top: 16),
            margin: const EdgeInsets.all(8),
            child: Text(
              title,
              style: Theme
                  .of(context)
                  .textTheme
                  .headline1,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 8, right: 24, left: 24),
            height: SizeConfig.screenHeight * 0.74,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: GridView.builder(
                itemCount: plants.length,
                gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    child: Column(
                      children: <Widget>[
                        Container(
                          height: 80,
                          width: 80,
                          child: Image.asset("assets/plants/plant3.png"),
                        ),
                        Text(
                          plants[index].name,
                          style: Theme
                              .of(context)
                              .textTheme
                              .bodyText1,
                        )
                      ],
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}