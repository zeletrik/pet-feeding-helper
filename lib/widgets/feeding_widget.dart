import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class FeedingWidget extends StatelessWidget {
  final Color color;
  final String title = 'Feeding';

  FeedingWidget(this.color);

  @override
  Widget build(BuildContext context) => new Scaffold(
      backgroundColor: color,
    body: CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          title: Text(title, style: TextStyle(color: Colors.white) ),
          centerTitle: false,
          backgroundColor: Color.fromARGB(180, 54, 55, 58),
          floating: true,
          flexibleSpace: Placeholder(),
          expandedHeight: 50,
          actions: [
            IconButton(
                icon: Icon(Icons.pets, color: Colors.white),
              onPressed: () {
                showCupertinoModalPopup(
                  context: context,
                  builder: (BuildContext context) => CupertinoPicker(
                    itemExtent: 1.3,
                    onSelectedItemChanged:  (value) {  },
                    children: [
                      Text('Asd')
                    ],

                  ),
                );
              },
            ),
          ],
        ),
        SliverToBoxAdapter(
          child: Stack(
            children: [
               ConstrainedBox(
                constraints: BoxConstraints(maxHeight: 220.0, minHeight: 220.0),
                child: Center(
                  child: SizedBox(
                    child: CircularProgressIndicator(
                      value: 0.7,
                      strokeWidth: 6,
                      valueColor: new AlwaysStoppedAnimation<Color>(Colors.blue),
                    ),
                    height: 200.0,
                    width: 200.0,
                  ),
                ),
              ),
              ConstrainedBox(
                constraints: BoxConstraints(maxHeight: 220.0, minHeight: 220.0),
                child: Center(
                  child: SizedBox(
                    child: CircularProgressIndicator(
                      value: 0.5,
                      strokeWidth: 6,
                      valueColor: new AlwaysStoppedAnimation<Color>(Colors.green),
                    ),
                    height: 180.0,
                    width: 180.0,
                  ),
                ),
              ),

            ],
          ),
        ),


        SliverList(
            delegate: SliverChildListDelegate(_buildList(50))
        ),
      ],
    ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );


  List _buildList(int count) {
    List<Widget> listItems = List();

    for (int i = 0; i < count; i++) {
      listItems.add(new Padding(padding: new EdgeInsets.all(20.0),
          child: new Text(
              'Item ${i.toString()}',
              style: TextStyle(fontSize: 25.0, color: Colors.white)
          )
      ));
    }

    return listItems;
  }
}