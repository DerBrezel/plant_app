
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plant_app/src/ui/CustomWidgets.dart';

class MyPlantOverview extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(title: Text("MyPlants"),),
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.all(8),
              child: Text("The Garden", style: Theme.of(context).textTheme.headline1,),),
            Container(
              margin: const EdgeInsets.only(top: 16, right: 8, left: 8),
              height: SizeConfig.screenHeight * 0.4,
              color: Colors.lightGreen,
            ),

          ],
        ),
      ),
    );
  }

}