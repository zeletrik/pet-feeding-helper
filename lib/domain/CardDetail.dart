import 'package:flutter/widgets.dart';

class CardDetail {
  final Color color;
  final String time;
  final IconData icon;
  final String title;
  final String subTitle;

  const CardDetail(this.icon, this.title, this.subTitle, this.time, this.color);
}
