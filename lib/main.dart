import 'package:flutter/material.dart';
import 'home_widget.dart';

void main() => runApp(PetFeederApp());

class PetFeederApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pet feeder helper',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      home: Home(title: 'Pet feeder helper'),
    );
  }
}
