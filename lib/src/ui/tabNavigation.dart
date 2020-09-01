import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plant_app/src/ui/MyPlantOverview.dart';
import 'package:plant_app/src/ui/SearchPlant.dart';
import 'package:plant_app/src/ui/testScreen.dart';

class TabNavigationItem {
  final Widget page;
  final Widget title;
  final Icon icon;

  TabNavigationItem({
    @required this.page,
    @required this.title,
    @required this.icon,
  });


  static List<TabNavigationItem> get items => [
    TabNavigationItem(
      page: MyPlantOverview(),
      icon: Icon(Icons.home),
      title: Text('Home')
    ),
    TabNavigationItem(
      page: SearchPlant(),
      icon: Icon(Icons.add_circle_outline),
      title: Text("Search Plant")
    ),
    TabNavigationItem(
      page: TestScreen(),
      icon: Icon(Icons.info),
      title: Text('TestScreen')

    )
  ];
}