
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plant_app/src/blocs/add_my_plant/my_plants_bloc.dart';
import 'package:plant_app/src/repository/plant_repository.dart';
import 'package:plant_app/src/ui/NavBarNavigation.dart';


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: TextTheme(
          headline1: TextStyle(fontSize: 50, fontFamily: 'Yeseva_One', color: Colors.black54),
          headline2: TextStyle(fontSize: 26, fontFamily: 'Yeseva_One', color: Colors.black54),
          headline3: TextStyle(fontSize: 18, fontFamily: 'Yeseva_One', color: Colors.black54),

          bodyText1: TextStyle(fontSize: 16, fontFamily: 'Assistant', color: Colors.black54),
          bodyText2: TextStyle(fontSize: 24, fontFamily: 'Assistant', color: Colors.black54),
        )
      ),
      home: BlocProvider(
        create: (context) => MyPlantsBloc(FakePlantRepository()),
        child: NavBarNavigation(),
      ),
    );
  }
}
