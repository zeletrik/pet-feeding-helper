import 'package:flutter/material.dart';

class TodayWidget extends StatelessWidget {
  final Color color;
  final String title = 'Next up';

  TodayWidget(this.color);

  @override
  Widget build(BuildContext context) => new Scaffold(
    backgroundColor: color,
    body: CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          title: Text(title),
          centerTitle: false,
          backgroundColor: Color.fromARGB(180, 54, 55, 58),
          floating: true,
          flexibleSpace: Placeholder(),
          expandedHeight: 50,
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
                (context, index) => ListTile(title: Text('Item #$index')),
            childCount: 15,
          ),
        ),
      ],
    ),
  );
}