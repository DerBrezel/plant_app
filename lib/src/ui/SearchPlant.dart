import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:flappy_search_bar/search_bar_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plant_app/src/model/plants.dart';

class SearchPlant extends StatelessWidget {

  //dummysearch
  Future<List<Plant>> search(String search) async {
    await Future.delayed(Duration(seconds: 2));
    return List.generate(search.length, (int index) {
      return Plant(name: search, waterValue: index.toDouble());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SearchBar<Plant>(
            onSearch: search,
            minimumChars: 3,
            loader: Center(child: Text("loading...")),
            cancellationText: Text("quit"),
            onItemFound: (Plant plant, int index) {
              //can also be handled with flutter staggered grid view.. google it.
              return ListTile(
                title: Text(plant.name, style: Theme.of(context).textTheme.headline2,),
                leading: Container(
                  height: 80,
                  width: 80,
                  child:  Image.asset("assets/plants/plant3.png"),
                ),
                subtitle: Text(plant.waterValue.toString()),
              );
            },
            searchBarStyle: SearchBarStyle(
              backgroundColor: Color(0xFFb8cfc9),
              padding: EdgeInsets.only(left: 4),
              borderRadius: BorderRadius.circular(10)
            ),
          ),
        ),
      ),
    );
  }

}