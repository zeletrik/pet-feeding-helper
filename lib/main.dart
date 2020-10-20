import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:intl/intl_standalone.dart';

import 'parent_widget.dart';
import 'themes.dart';

void main() => runApp(PetFeederApp());

class PetFeederApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    findSystemLocale();
    initializeDateFormatting(Intl.systemLocale, null);

    return MaterialApp(
      title: 'Pet feeder helper',
      theme: setLightTheme,
      darkTheme: setDarkTheme,
      home: Parent(title: 'Pet feeder helper'),
    );
  }
}
