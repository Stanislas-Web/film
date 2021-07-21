import 'package:film/blocs/movies_bloc.dart';
import 'package:film/blocs/tv_bloc.dart';
import 'package:film/src/routeStack.dart';
import 'package:flutter/material.dart';



class App extends StatefulWidget {
  const App({ Key key }) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        // theme: ThemeData.dark(),
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: RouteStack(),
        ),
      );
  }
}
