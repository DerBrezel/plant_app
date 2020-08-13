
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plant_app/src/ui/CustomWidgets.dart';

class MainScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("Home"),),
      body: Container(
        height: SizeConfig.screenHeight * 0.3,
        child: Column(
          children: <Widget>[

            Text("This is a Test")
        ]),
      ),
    );
  }

}