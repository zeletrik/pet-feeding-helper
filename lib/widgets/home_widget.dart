import 'dart:developer';

import 'package:cupertino_rounded_corners/cupertino_rounded_corners.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:petfeeder/domain/CardDetail.dart';
import 'package:petfeeder/domain/RingDetail.dart';
import 'package:petfeeder/widgets/common/rings.dart';

import 'common/add_bottom_sheet.dart';
import 'common/item_card.dart';

class HomeWidget extends StatelessWidget {
  final Color color;
  final String title = 'Today';

  HomeWidget(this.color);

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
                                    switchPet('Pet1');
                                    Navigator.pop(context, 'Pet1');
                                  },
                                ),
                                CupertinoActionSheetAction(
                                  child: const Text('Pet #2'),
                                  onPressed: () {
                                    switchPet('Pet2');
                                    Navigator.pop(context, 'Pet2');
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
                child: Rings(ringDetails: [
              RingDetail(Color(0xFF95DBE5), 0.7),
              RingDetail(Color(0xFF078282), 0.3),
              RingDetail(Color(0xFF339E66), 0.2),
              RingDetail(Color(0xFF95DBE5), 0.7),
              RingDetail(Color(0xFF078282), 0.4),
              RingDetail(Color(0xFF339E66), 0.9),
            ])),
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
              child: Padding(
                padding: EdgeInsets.fromLTRB(0, 12, 0, 0),
              ),
            ),
            SliverToBoxAdapter(
              child: Align(
                  alignment: Alignment(-0.95, 0.0),
                  child: Text('Scheduled',
                      style: TextStyle(
                          color: Theme
                              .of(context)
                              .textTheme
                              .headline1
                              .color))),
            ),
            SliverToBoxAdapter(
              child: Divider(
                color: Theme
                    .of(context)
                    .textTheme
                    .headline1
                    .color,
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
            showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                builder: (BuildContext bc) =>
                    Container(
                        height: MediaQuery
                            .of(context)
                            .size
                            .height * 0.9,
                        color: Colors.transparent,
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment(0.0, -0.90),
                              child: Container(
                                height: 5,
                                width: 100,
                                decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                              ),
                            ),
                            Expanded(
                              child: AddIntakeBottomSheet(),
                            )
                          ],
                        )));
          },
        ),
      );

  List _buildList(int count, BuildContext context) {
    List<Widget> listItems = List();
    for (int i = 0; i < count; i++) {
      listItems.add(ItemCard(
          cardDetail: CardDetail(
              i.isEven ? Icons.medical_services_outlined : Icons.restaurant,
              i.isEven
                  ? 'Medication intake ${i.toString()} g'
                  : 'Food intake ${i.toString()} g',
              'Overall progress: ${i.toString()}%',
              '10:30',
              i.isEven ? Color(0xFF95DBE5) : Color(0xFF078282))));
      listItems.add(ItemCard(
          cardDetail: CardDetail(Icons.waves, 'Water intake 20 g',
              'Overall progress: 3%', '10:30', Color(0xFF339E66))));
    }
    return listItems;
  }

  void switchPet(String name) {
    log('Switch to pet ${name}');
  }
}
