import 'package:cupertino_rounded_corners/cupertino_rounded_corners.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:petfeeder/domain/CardDetail.dart';

// ignore: must_be_immutable
class ItemCard extends StatelessWidget {
  final CardDetail cardDetail;

  const ItemCard({this.cardDetail});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: CupertinoCard(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            leading:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Icon(
                cardDetail.icon,
                color: Theme.of(context).backgroundColor,
              ),
            ]),
            title: Text(cardDetail.title,
                style: TextStyle(color: Theme.of(context).backgroundColor)),
            subtitle: Text(cardDetail.subTitle,
                style: TextStyle(color: Theme.of(context).backgroundColor)),
            trailing: Text(cardDetail.time,
                style: TextStyle(color: Theme.of(context).backgroundColor)),
          ),
        ],
      ),
      elevation: 2.0,
      margin: const EdgeInsets.fromLTRB(6.0, 3.0, 6.0, 0.0),
      padding: const EdgeInsets.all(0.0),
      color: cardDetail.color,
      radius: 20.0,
    ));
  }
}
