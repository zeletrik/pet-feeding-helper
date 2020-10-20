import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:petfeeder/domain/RingDetail.dart';

// ignore: must_be_immutable
class Rings extends StatelessWidget {

  final List<RingDetail> ringDetails;

  const Rings({ this.ringDetails });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        for ( var ring in ringDetails ) ConstrainedBox(
          constraints:
          BoxConstraints(maxHeight: 220.0, minHeight: 220.0),
          child: Center(
            child: SizedBox(
              child: CircularProgressIndicator(
                value: ring.progress,
                strokeWidth: calcStrokeWidth(),
                valueColor:
                new AlwaysStoppedAnimation<Color>(ring.color),
              ),
              height: calcSize(ringDetails.indexOf(ring)),
              width: calcSize(ringDetails.indexOf(ring)),
            ),
          ),
        )
      ],
    );
  }

  double calcStrokeWidth() {
    int count = ringDetails.length;
    return count > 4
        ? 10
        : 13;
  }

  double calcSize(int index) {
    int count = ringDetails.length;
    return count > 4
        ? 200.0 - (index * 35)
        : 200.0 - (index * 55);
  }


}

