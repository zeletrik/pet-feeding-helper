import 'package:flutter/material.dart';

class TodayWidget extends StatelessWidget {
  final Color color;

  TodayWidget(this.color);

  @override
  Widget build(BuildContext context) => new Scaffold(
    backgroundColor: color,
  );
}