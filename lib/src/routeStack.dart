import 'dart:io';
import 'package:film/config/size_config.dart';
import 'package:film/ui/film.dart';
import 'package:film/ui/home.dart';
import 'package:flutter/material.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/cupertino.dart';


class RouteStack extends StatefulWidget {
  RouteStack({Key key, this.label}) : super(key: key);
  final String label;

  @override
  _RouteStackState createState() => _RouteStackState();
}

class _RouteStackState extends State<RouteStack> {
  int _selectedIndex = 0;
  PageController pageController = PageController();
  bool _tryAgain = false;
  bool connectState = false;
  String theme;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkConnection();
  }

  Future checkConnection() async {
    try {
      setState(() {
        _tryAgain = true;
      });
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        print('connected');
        setState(() {
          connectState = true;
          setState(() {
            _tryAgain = false;
          });
        });
      }
    } on SocketException catch (_) {
      print('not connected');
      setState(() {
        connectState = false;
        _tryAgain = false;
      });
    }
  }

  void _onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List<Widget> _screens = [Home(),Film(),Film(),Film()];

  // ignore: unused_element
  void _onItemTapped(int index) {
    pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      // backgroundColor: Color(0xFFFFFFFF),
      body: PageView(
        controller: pageController,
        onPageChanged: _onPageChanged,
        children: _screens,
        physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.circular(getProportionateScreenWidth(50)),
        child: BottomNavyBar(
          selectedIndex: _selectedIndex,
          showElevation: true,
          itemCornerRadius: 24,
          curve: Curves.easeIn,
          onItemSelected: (index) {
            setState(() => _selectedIndex = index);
            _onItemTapped(index);
          },
          items: <BottomNavyBarItem>[
            BottomNavyBarItem(
              // icon: SvgPicture.asset(
              //   "assets/icons/home.svg",
              //   color: Color(0xff243656),
              // ),
              icon: Icon(Icons.home),
              title: Text(
                'Home',
                style: TextStyle(
                  // color: Color(0xff243656),
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                ),
              ),
              activeColor: Colors.grey,
              textAlign: TextAlign.center,
              inactiveColor: Colors.grey,
            ),
            BottomNavyBarItem(
              // icon: SvgPicture.asset("assets/icons/users.svg"),
              icon: Icon(Icons.movie),
              title: Text(
                'Film',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                ),
              ),
              activeColor: Colors.grey,
              inactiveColor: Colors.grey,
              textAlign: TextAlign.center,
            ),
             BottomNavyBarItem(
              // icon: SvgPicture.asset("assets/icons/users.svg"),
              icon: Icon(Icons.tv),
              title: Text(
                'Serie',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                ),
              ),
              activeColor: Colors.grey,
              inactiveColor: Colors.grey,
              textAlign: TextAlign.center,
            ),
              BottomNavyBarItem(
              // icon: SvgPicture.asset("assets/icons/users.svg"),
              icon: Icon(Icons.favorite),
              title: Text(
                'Favoris',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                ),
              ),
              activeColor: Colors.grey,
              inactiveColor: Colors.grey,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
