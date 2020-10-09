import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class PetsWidget extends StatelessWidget {
  final Color color;
  final String title = 'Pets';

  PetsWidget(this.color);

  @override
  Widget build(BuildContext context) => new Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: AppBar(
          title: Text(
              title,
              style: Theme.of(context).textTheme.headline1
          ),
          centerTitle: false,
          brightness: Theme.of(context).brightness,
          backgroundColor: Theme.of(context).backgroundColor,
          shadowColor: Theme.of(context).backgroundColor,
          elevation: 0,
          actions: [
            IconButton(
              icon: Icon(
                  Icons.settings,
                  color: Theme.of(context).textTheme.headline1.color
              ),
              onPressed: () {
                /* TODO */
              },
            ),
          ],
        ),
        body: CustomScrollView(
          slivers: <Widget>[
            SliverGrid(
              delegate: SliverChildBuilderDelegate(
                (c, i) => _getPetCard(i, c),
                childCount: 7,
              ),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
            ),
          ],
        ),
      );

  Widget _getPetCard(int index, BuildContext context) {
    return CupertinoButton(
      child: Container(
        height: 250,
        width: 250,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/cat.jpg"),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Container(
          margin: EdgeInsets.fromLTRB(15, 15, 0, 0),
          child: Text(
            "Test cat $index",
            style: TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.w600),
          ),
        ),
      ),
      onPressed: () {
        showCupertinoDialog(
          context: context,
          builder: (BuildContext context) => CupertinoAlertDialog(
            title: const Text('Card is clicked.'),
            actions: <Widget>[
              CupertinoDialogAction(
                child: const Text('ok'),
                onPressed: () {
                  Navigator.pop(context, 'ok');
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
