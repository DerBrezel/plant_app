
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plant_app/src/ui/tabNavigation.dart';

class NavBarNavigation extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _NavBarNavigationState();
  }
}

class _NavBarNavigationState extends State<NavBarNavigation>{
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            for (final tabItem in TabNavigationItem.items)
              BottomNavigationBarItem(
                icon: tabItem.icon,
                title: tabItem.title,
              )
          ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        unselectedItemColor: Colors.black,
        onTap: _onItemTapped,
      ),
        body: IndexedStack(
          index: _selectedIndex,
          children: <Widget>[
            for (final tabItem in TabNavigationItem.items) tabItem.page,
          ],
        ));
  }

}