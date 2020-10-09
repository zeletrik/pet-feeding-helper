import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:cupertino_rounded_corners/cupertino_rounded_corners.dart';

class MainWidget extends StatelessWidget {
  final Color color;
  final String title = 'Feeding';

  MainWidget(this.color);

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
                  icon: Icon(Icons.pets,
                      color: Theme.of(context).textTheme.headline1.color),
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
            SliverToBoxAdapter(
              child: Stack(
                children: [
                  ConstrainedBox(
                    constraints:
                        BoxConstraints(maxHeight: 220.0, minHeight: 220.0),
                    child: Center(
                      child: SizedBox(
                        child: CircularProgressIndicator(
                          value: 0.7,
                          strokeWidth: 8,
                          valueColor:
                              new AlwaysStoppedAnimation<Color>(Color(0xFF95DBE5)),
                        ),
                        height: 200.0,
                        width: 200.0,
                      ),
                    ),
                  ),
                  ConstrainedBox(
                    constraints:
                        BoxConstraints(maxHeight: 220.0, minHeight: 220.0),
                    child: Center(
                      child: SizedBox(
                        child: CircularProgressIndicator(
                          value: 0.5,
                          strokeWidth: 8,
                          valueColor:
                              new AlwaysStoppedAnimation<Color>(Color(0xFF078282)),
                        ),
                        height: 170.0,
                        width: 170.0,
                      ),
                    ),
                  ),
                  ConstrainedBox(
                    constraints:
                        BoxConstraints(maxHeight: 220.0, minHeight: 220.0),
                    child: Center(
                      child: SizedBox(
                        child: CircularProgressIndicator(
                          value: 0.85,
                          strokeWidth: 8,
                          valueColor:
                              new AlwaysStoppedAnimation<Color>(Color(0xFF339E66)),
                        ),
                        height: 140.0,
                        width: 140.0,
                      ),
                    ),
                  ),
                  ConstrainedBox(
                    constraints:
                        BoxConstraints(maxHeight: 220.0, minHeight: 220.0),
                    child: Center(
                      child: SizedBox(
                        child: Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/cat.jpg"),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                        height: 100.0,
                        width: 100.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: Center(
                child: CupertinoCard(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      ListTile(
                        title: Text('Pet name',
                            style: TextStyle(
                                color: Theme.of(context).backgroundColor)),
                        subtitle: Text('Overall progress: 85%',
                            style: TextStyle(
                                color: Theme.of(context).backgroundColor)),
                      ),
                    ],
                  ),
                  elevation: 2.0,
                  margin: const EdgeInsets.fromLTRB(6.0, 4.0, 6.0, 4.0),
                  padding: const EdgeInsets.all(0.0),
                  color: Colors.grey,
                  radius: 20.0,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Divider(
                color: Theme.of(context).textTheme.headline1.color,
                height: 15,
                thickness: 0.5,
                indent: 5,
                endIndent: 5,
              ),
            ),
            SliverList(
                delegate: SliverChildListDelegate(_buildList(15, context))),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          tooltip: 'Increment',
          child: Icon(Icons.add),
          onPressed: () {
            /* TODO */
          },
        ),
      );

  List _buildList(int count, BuildContext context) {
    List<Widget> listItems = List();

    for (int i = 0; i < count; i++) {
      listItems.add(Center(
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
            ),
          ],
        ),
        elevation: 2.0,
        margin: const EdgeInsets.fromLTRB(6.0, 3.0, 6.0, 0.0),
        padding: const EdgeInsets.all(0.0),
        color: i.isEven ? Color(0xFF95DBE5) : Color(0xFF078282),
        radius: 20.0,
      )));
      listItems.add(
          Center(
              child: CupertinoCard(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ListTile(
                      leading: Icon(
                        Icons.waves,
                        color: Theme.of(context).backgroundColor,
                      ),
                      title: Text('Water intake ${i.toString()} g',
                          style: TextStyle(color: Theme.of(context).backgroundColor)),
                      subtitle: Text('Overall progress: ${i.toString()}%',
                          style: TextStyle(color: Theme.of(context).backgroundColor)),
                    ),
                  ],
                ),
                elevation: 2.0,
                margin: const EdgeInsets.fromLTRB(6.0, 3.0, 6.0, 0.0),
                padding: const EdgeInsets.all(0.0),
                color: Color(0xFF339E66),
                radius: 20.0,
              ))
      );
    }
    return listItems;
  }
}
