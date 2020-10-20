import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
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
                Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 16)),
                CupertinoButton(
                    color: CupertinoColors.systemBlue,
                    borderRadius: new BorderRadius.circular(30.0),
                    child: new Text(
                      "DEBUG",
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
    elements.forEach(
        (widget) => food.add((widget as IntakeWidget).controller.text));
    elements.forEach((widget) =>
        medication.add((widget as IntakeWidget).segmentControl.toString()));
    setState(() {});
  }
}

// ignore: must_be_immutable
class IntakeWidget extends StatelessWidget {
  final TextEditingController controller = TextEditingController();
  int segmentControl = 0;

  IntakeWidget();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CupertinoSlidingSegmentedControl(
            groupValue: segmentControl,
            children: const <int, Widget>{
              0: Text('Food'),
              1: Text('Medication'),
              2: Text('Status')
            },
            onValueChanged: (i) {
              segmentControl = i;
              log('Value changed $i');
            }),
        Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 16)),
        CupertinoTextField(
            controller: controller,
            prefix: Icon(
              CupertinoIcons.add_circled_solid,
              color: CupertinoColors.activeGreen,
              size: 28,
            ),
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
            clearButtonMode: OverlayVisibilityMode.editing,
            keyboardType: TextInputType.emailAddress,
            autocorrect: false,
            placeholder: 'Foo'),
        Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 16))
      ],
    );
  }
}
