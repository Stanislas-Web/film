import 'package:flutter/material.dart';
import 'package:film/ui/movie_list.dart';
import 'package:film/ui/home.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
        // theme: ThemeData.dark(),
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Home(),
        ),
      );
  }
}