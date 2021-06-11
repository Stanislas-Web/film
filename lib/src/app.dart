import 'package:film/src/routeStack.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
        // theme: ThemeData.dark(),
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: RouteStack(),
        ),
      );
  }
}