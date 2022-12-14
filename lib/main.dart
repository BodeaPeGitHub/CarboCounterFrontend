import 'package:carbo_counter_frontend/pages/screen1.dart';
import 'package:carbo_counter_frontend/pages/screen2.dart';
import 'package:carbo_counter_frontend/pages/screen3.dart';
import 'package:carbo_counter_frontend/pages/screen4.dart';
import 'package:flutter/material.dart';

import 'bottom_menu/menu_style.dart';
import 'bottom_menu/nav_bar.dart';
import 'bottom_menu/nav_bar_item.dart';
import 'bottom_menu/utils.dart';

void main() {
  runApp(CarboCounter());
}

class CarboCounter extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CarboCounterState();
}

class _CarboCounterState extends State<CarboCounter> {
  final Widget _screen1 = const Screen1();
  final Widget _screen2 = const Screen2();
  final Widget _screen3 = const Screen3();
  final Widget _screen4 = const Screen4();
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Carbo Counter'),
        ),
        body: getBody(),
        bottomNavigationBar: MoonyNavigationBar(
          items: <NavigationBarItem>[
            NavigationBarItem(
                icon: Icons.home_rounded,
                onTap: () {
                  onTapHandler(0);
                }),
            NavigationBarItem(
                icon: Icons.favorite_border_outlined,
                activeIcon: Icons.favorite,
                color: Colors.pink,
                indicatorColor: Colors.pink,
                onTap: () {
                  onTapHandler(1);
                }),
            NavigationBarItem(
                icon: Icons.search,
                onTap: () {
                  onTapHandler(2);
                }),
            NavigationBarItem(
                icon: Icons.person_outline,
                onTap: () {
                  onTapHandler(3);
                })
          ],
          style: MoonyNavStyle(
            activeColor: Theme.of(context).primaryColor,
            indicatorPosition: IndicatorPosition.TOP,
            indicatorType: IndicatorType.POINT,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
          ),
        ),
      ),
    );
  }

  Widget getBody() {
    if (selectedIndex == 0) {
      return _screen1;
    } else if (selectedIndex == 1) {
      return _screen2;
    } else if (selectedIndex == 2) {
      return _screen3;
    }
    return _screen4;
  }

  void onTapHandler(int index) {
    setState(() {
      selectedIndex = index;
    });
  }
}
