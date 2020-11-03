import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

typedef void IntCallback(int id);

class AddIntakeBottomSheet extends StatefulWidget {
  @override
  _AddIntakeBottomSheetState createState() => _AddIntakeBottomSheetState();
}

class _AddIntakeBottomSheetState extends State<AddIntakeBottomSheet> {
  final List<TextEditingController> controllers = List();

  List<String> food = List();
  List<String> medication = List();

  List<Widget> elements = List();

  _AddIntakeBottomSheetState() {
    elements.add(IntakeWidget());
  }

  @override
  Widget build(BuildContext context) {
    return ListView(physics: ScrollPhysics(), children: [
      Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 16)),
      Container(
        width: MediaQuery.of(context).size.width * 0.9,
        child: Column(
          children: [
                Text('Add intake',
                    style: Theme.of(context).textTheme.headline1),
                Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 16)),
              ] +
              elements +
              [
                CupertinoButton(
                    color: CupertinoColors.activeGreen,
                    borderRadius: new BorderRadius.circular(30.0),
                    child: new Text(
                      "Add more",
                      textAlign: TextAlign.center,
                      style: new TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      addNewField();
                    }),
                Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 8)),
                CupertinoButton(
                    color: CupertinoColors.systemBlue,
                    borderRadius: new BorderRadius.circular(30.0),
                    child: new Text(
                      "Save",
                      textAlign: TextAlign.center,
                      style: new TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      log('on pressed');
                      submitData();
                      food.forEach((element) {
                        log('Text value: $element');
                      });
                      medication.forEach((element) {
                        log('segmentControl value: $element');
                      });
                    })
              ],
        ),
      )
    ]);
  }

  void addNewField() {
    elements.add(IntakeWidget());
    setState(() {});
  }

  submitData() {
    food = [];
    medication = [];
    elements
        .forEach((widget) => food.add(getInputData(widget as IntakeWidget)));
    elements.forEach((widget) =>
        medication.add((widget as IntakeWidget).segmentControl.toString()));
    setState(() {});
  }

  String getInputData(IntakeWidget widget) {
    String data;
    switch (widget.segmentControl) {
      case 0:
        data = widget.foodController.text;
        break;
      case 1:
        data = widget.medicController.text;
        break;
      case 2:
        data = widget.statusController.text;
        break;
      default:
        throw new Exception('Corrupted data found');
    }
    return data;
  }
}

// ignore: must_be_immutable
class IntakeWidget extends StatefulWidget {
  final TextEditingController foodController = TextEditingController();
  final TextEditingController medicController = TextEditingController();
  final TextEditingController statusController = TextEditingController();
  int segmentControl = 0;

  refresh(int id) {
    segmentControl = id;
  }

  @override
  _IntakeWidgetState createState() => _IntakeWidgetState(
      foodController: foodController,
      medicController: medicController,
      statusController: statusController,
      notifyParent: refresh);
}

class _IntakeWidgetState extends State<IntakeWidget> {
  final TextEditingController foodController;
  final TextEditingController medicController;
  final TextEditingController statusController;
  final Function(int id) notifyParent;

  _IntakeWidgetState(
      {this.notifyParent,
      this.foodController,
      this.medicController,
      this.statusController});

  int segmentControl = 0;

  final Map<int, Widget> tabs = const <int, Widget>{
    0: Text('Food'),
    1: Text('Medication'),
    2: Text('Status')
  };

  // TODO: Extract intake domain
  // currentValue, items, unit
  String currentValue = 'Solo';
  String unit = 'gramm';
  final items = const ['Solo', 'Hills ZD', 'Royal Canin'];

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      CupertinoSlidingSegmentedControl(
          groupValue: segmentControl,
          children: tabs,
          onValueChanged: (i) {
            setState(() {
              segmentControl = i;
              notifyParent.call(i);
            });
          }),
      Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 16)),
      if (segmentControl == 0)
        Row(
          children: [
            Container(
                width: MediaQuery.of(context).size.width * 0.30,
                margin: EdgeInsets.fromLTRB(6, 0, 6, 0),
                child: OutlineButton(
                    color: Colors.transparent,
                    padding: EdgeInsets.fromLTRB(3, 3, 3, 3),
                    child: new Text(
                      currentValue,
                      textAlign: TextAlign.center,
                      style: new TextStyle(color: Colors.blue),
                    ),
                    onPressed: () {
                      showModalBottomSheet(
                          context: context,
                          builder: (BuildContext context) => Container(
                              height: MediaQuery.of(context).size.height * 0.2,
                              color: Colors.transparent,
                              child: CupertinoPicker(
                                onSelectedItemChanged: (value) {
                                  setState(() {
                                    currentValue = items.elementAt(value);
                                  });
                                },
                                itemExtent: 42.0,
                                children: List<Widget>.generate(items.length,
                                    (int index) {
                                  return Text(items[index]);
                                }),
                                scrollController: FixedExtentScrollController(
                                    initialItem: items.indexOf(currentValue)),
                              )));
                    })),
            Container(
                width: MediaQuery.of(context).size.width * 0.65,
                child: CupertinoTextField(
                    controller: foodController,
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                    clearButtonMode: OverlayVisibilityMode.editing,
                    keyboardType: TextInputType.number,
                    autocorrect: false,
                    placeholder: '$unit'))
          ],
        ),
      if (segmentControl == 1)
        CupertinoTextField(
            controller: medicController,
            prefix: Icon(
              CupertinoIcons.add_circled_solid,
              color: CupertinoColors.activeGreen,
              size: 28,
            ),
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
            clearButtonMode: OverlayVisibilityMode.editing,
            keyboardType: TextInputType.emailAddress,
            autocorrect: false,
            placeholder: 'Bar + $segmentControl'),
      if (segmentControl == 2)
        CupertinoTextField(
            controller: statusController,
            minLines: 5,
            maxLines: 10,
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
            clearButtonMode: OverlayVisibilityMode.editing,
            keyboardType: TextInputType.multiline,
            autocorrect: false,
            placeholder: 'Provide status info'),
      Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 16))
    ]);
  }
}
