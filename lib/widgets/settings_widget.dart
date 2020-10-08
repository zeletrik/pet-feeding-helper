import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class SettingsWidget extends StatelessWidget {
  final Color color;
  final String title = 'Pets';

  SettingsWidget(this.color);

  @override
  Widget build(BuildContext context) => new Scaffold(
        backgroundColor: color,
        appBar: AppBar(
          title: Text(
            title,
            style: TextStyle(color: Colors.white.withOpacity(1.0)),
          ),
          actions: [
            IconButton(icon: Icon(Icons.settings, color: Colors.white)),
          ],
          backgroundColor: Color.fromARGB(60, 54, 55, 58),
          centerTitle: false,
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
        height: 150,
        width: 150,
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
