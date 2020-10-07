import 'package:flutter/material.dart';

class SettingsWidget extends StatelessWidget {
  final Color color;

  SettingsWidget(this.color);

  @override
  Widget build(BuildContext context) => new Scaffold(
    backgroundColor: color,
  );
}