import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plant_app/src/ui/CustomWidgets.dart';

class MyPlantOverview extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyPlantOverviewState();
  }
}

class _MyPlantOverviewState extends State<MyPlantOverview> {

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      /*appBar: AppBar(
        title: Text("MyPlants"),
      ),*/
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [const Color(0xFFFFFFFF), const Color(0xFFBFD6E7)],
              tileMode: TileMode.repeated,
            )
          ),
          child: Column(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.only(top: 16),
                margin: const EdgeInsets.all(8),
                child: Text(
                  "The Garden",
                  style: Theme.of(context).textTheme.headline1,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 8, right: 8, left: 8),
                height: SizeConfig.screenHeight * 0.6,
                child: GridView.builder(
                    itemCount: 5,
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
                              "Aspergus",
                              style: Theme.of(context).textTheme.bodyText2,
                            )
                          ],
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
