import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:petfeeder/domain/CardDetail.dart';

import 'domain/DayWrapper.dart';
import 'widgets/common/item_card.dart';

class DayBuilder {
  final List<DayWrapper> wrappers;

  const DayBuilder({this.wrappers});

  List buildDayList(BuildContext context) {
    List<Widget> listItems = List();

    wrappers.forEach((wrapper) {
      listItems.add(
        Align(
            alignment: Alignment(-0.95, 0.0),
            child: Text(formatDate(wrapper.date),
                style: TextStyle(
                    color: Theme.of(context).textTheme.headline1.color))),
      );
      listItems.add(Divider(
        color: Theme.of(context).textTheme.headline1.color,
        height: 15,
        thickness: 0.5,
        indent: 5,
        endIndent: 5,
      ));
      wrapper.cardDetails.forEach((card) {
        listItems.add(ItemCard(
            cardDetail: CardDetail(
                card.icon, card.title, card.subTitle, card.time, card.color)));
      });
      listItems.add(Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 16)));
    });

    return listItems;
  }

  String formatDate(DateTime date) {
    var formatter = new DateFormat.yMMMMd(Intl.systemLocale);
    var formatted = formatter.format(date);
    var result = formatted;
    if (formatted == formatter.format(DateTime.now())) {
      result = 'Today';
    }
    return result;
  }
}
