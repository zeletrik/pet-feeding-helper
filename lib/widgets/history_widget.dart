import 'package:cupertino_rounded_corners/cupertino_rounded_corners.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HistoryWidget extends StatelessWidget {
  final Color color;
  final String title = 'History';

  HistoryWidget(this.color);

  @override
  Widget build(BuildContext context) => new Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              title: Text(title, style: Theme.of(context).textTheme.headline1),
              centerTitle: false,
              brightness: Theme.of(context).brightness,
              backgroundColor: Theme.of(context).backgroundColor,
              floating: true,
              expandedHeight: 50,
              actions: [
                IconButton(
                  icon: Container(
                    height: 34,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/cat.jpg"),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  // Icon(Icons.pets, color: Theme.of(context).textTheme.headline1.color),
                  onPressed: () {
                    showCupertinoModalPopup(
                        context: context,
                        builder: (BuildContext context) => CupertinoActionSheet(
                              title: const Text('Pet chooser'),
                              message: const Text('Your pets are'),
                              actions: <Widget>[
                                CupertinoActionSheetAction(
                                  child: const Text('Pet #1'),
                                  onPressed: () {
                                    Navigator.pop(context, 'Pet1');
                                  },
                                ),
                                CupertinoActionSheetAction(
                                  child: const Text('Pet #2'),
                                  onPressed: () {
                                    Navigator.pop(context, 'pet2');
                                  },
                                )
                              ],
                              cancelButton: CupertinoActionSheetAction(
                                child: const Text('Cancel'),
                                isDefaultAction: true,
                                onPressed: () {
                                  Navigator.pop(context, 'Cancel');
                                },
                              ),
                            ));
                  },
                ),
              ],
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
                          color: i.isEven ? Color(0xFF184A45) : Color(0xFFB0B8B4),
                          radius: 20.0,
                        )),
            childCount: 15,
          ),
        ),
      ],
    ),
  );
}