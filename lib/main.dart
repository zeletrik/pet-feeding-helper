import 'package:flutter/material.dart';
import 'parent_widget.dart';
import 'themes.dart';

void main() => runApp(PetFeederApp());

class PetFeederApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pet feeder helper',
      theme: setLightTheme,
      darkTheme: setDarkTheme,
      home: Parent(title: 'Pet feeder helper'),
    );
  }
}
