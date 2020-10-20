import 'package:flutter/material.dart';
import 'package:petfeeder/widgets/home_widget.dart';
import 'package:petfeeder/widgets/history_widget.dart';
import 'widgets/pets_widget.dart';

// ignore: must_be_immutable
class Parent extends StatefulWidget {
  Parent({Key key, this.title}) : super(key: key);

  String title;

  @override
  State<StatefulWidget> createState() {
    return _ParentState();
  }
}

class _ParentState extends State<Parent> {
  int _currentIndex = 0;

  final List<Widget> _children = [
    HomeWidget(Color.fromARGB(255, 32, 33, 36)),
    HistoryWidget(Color.fromARGB(255, 32, 33, 36)),
    PetsWidget(Color.fromARGB(255, 32, 33, 36))
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        backgroundColor:  Theme.of(context).dividerColor,
        //backgroundColor: Color.fromARGB(220, 54, 55, 58),
        selectedItemColor: Colors.blue,
        unselectedItemColor: Color.fromARGB(255, 153, 159, 165),
        items: [
          new BottomNavigationBarItem(
            icon: Icon(Icons.today),
            label: 'Today',
          ),
          new BottomNavigationBarItem(
            icon: Icon(Icons.assignment),
            label: 'History',
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


