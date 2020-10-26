import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:petfeeder/domain/CardDetail.dart';
import 'package:petfeeder/domain/DayWrapper.dart';

import '../day_builder.dart';

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
                delegate: SliverChildListDelegate(DayBuilder(wrappers: [
                  DayWrapper(date: DateTime.now(), cardDetails: [
                    CardDetail(Icons.waves, 'Water intake 20 g',
                        'Overall progress: 3%', '10:30', Color(0xFF339E66)),
                    CardDetail(Icons.waves, 'Water intake 20 g',
                        'Overall progress: 3%', '10:30', Color(0xFF339E66)),
                    CardDetail(Icons.waves, 'Water intake 20 g',
                        'Overall progress: 3%', '10:30', Color(0xFF339E66)),
                    CardDetail(Icons.waves, 'Water intake 20 g',
                        'Overall progress: 3%', '10:30', Color(0xFF339E66)),
                  ]),
                  DayWrapper(
                  date: DateTime.now().subtract(Duration(days: 1)),
                  cardDetails: [
                    CardDetail(Icons.favorite_border_sharp, 'Water intake 20 g',
                        'Overall progress: 3%', '10:30', Color(0xFF339E66)),
                    CardDetail(Icons.favorite_border_sharp, 'Water intake 20 g',
                        'Overall progress: 3%', '10:30', Color(0xFF339E66)),
                    CardDetail(Icons.waves, 'Water intake 20 g',
                        'Overall progress: 3%', '10:30', Color(0xFF339E66)),
                    CardDetail(Icons.favorite_border_sharp, 'Water intake 20 g',
                        'Overall progress: 3%', '10:30', Color(0xFF339E66)),
                  ])
            ]).buildDayList(context))),
          ],
        ),
      );
}
