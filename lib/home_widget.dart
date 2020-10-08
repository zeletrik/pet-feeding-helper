import 'package:flutter/material.dart';
import 'package:petfeeder/widgets/feeding_widget.dart';
import 'package:petfeeder/widgets/today_widget.dart';
import 'widgets/settings_widget.dart';

// ignore: must_be_immutable
class Home extends StatefulWidget {
  Home({Key key, this.title}) : super(key: key);

  String title;

  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;

  final List<Widget> _children = [
    FeedingWidget(Color.fromARGB(255, 32, 33, 36)),
    TodayWidget(Color.fromARGB(255, 32, 33, 36)),
    SettingsWidget(Color.fromARGB(255, 32, 33, 36))
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        backgroundColor: Color.fromARGB(220, 54, 55, 58),
        selectedItemColor: Colors.lightBlueAccent,
        unselectedItemColor: Color.fromARGB(255, 153, 159, 165),
        items: [
          new BottomNavigationBarItem(
            icon: Icon(Icons.set_meal),
            label: 'Home',
          ),
          new BottomNavigationBarItem(
            icon: Icon(Icons.assignment),
            label: 'Upcoming',
          ),
          new BottomNavigationBarItem(
              icon: Icon(Icons.pets),
              label: 'Pets'
          )
        ],
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}


