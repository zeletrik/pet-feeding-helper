import 'package:flutter/material.dart';
import 'package:cupertino_rounded_corners/cupertino_rounded_corners.dart';

class UpnextWidget extends StatelessWidget {
  final Color color;
  final String title = 'Next up';

  UpnextWidget(this.color);

  @override
  Widget build(BuildContext context) => new Scaffold(
    backgroundColor: Theme.of(context).backgroundColor,
    body: CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          title: Text(title,
              style: Theme.of(context).textTheme.headline1
          ),
          centerTitle: false,
          brightness: Theme.of(context).brightness,
          backgroundColor: Theme.of(context).backgroundColor,
          floating: true,
          expandedHeight: 50,
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
                (context, i) =>
                    Center(
                        child: CupertinoCard(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              ListTile(
                                leading: Icon(
                                  i.isEven ? Icons.medical_services_outlined : Icons.restaurant,
                                  color: Theme.of(context).backgroundColor,
                                ),
                                title: Text(
                                    i.isEven
                                        ? 'Medication intake ${i.toString()} g'
                                        : 'Food intake ${i.toString()} g',
                                    style: TextStyle(color: Theme.of(context).backgroundColor)),
                                subtitle: Text('Overall progress: ${i.toString()}%',
                                    style: TextStyle(color: Theme.of(context).backgroundColor)),
                                  trailing: Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage("assets/cat.jpg"),
                                        fit: BoxFit.cover,
                                      ),
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                  ),
                              ),
                            ],
                          ),
                          elevation: 2.0,
                          margin: const EdgeInsets.fromLTRB(6.0, 3.0, 6.0, 0.0),
                          padding: const EdgeInsets.all(0.0),
                          color: i.isEven ? Colors.red : Colors.green,
                          radius: 20.0,
                        )),
            childCount: 15,
          ),
        ),
      ],
    ),
  );
}