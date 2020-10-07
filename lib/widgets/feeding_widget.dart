import 'package:flutter/material.dart';

class FeedingWidget extends StatelessWidget {
  final Color color;

  FeedingWidget(this.color);

  @override
  Widget build(BuildContext context) => new Scaffold(
      backgroundColor: color,
      floatingActionButton: FloatingActionButton(
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
}