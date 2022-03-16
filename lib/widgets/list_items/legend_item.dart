import 'package:flutter/material.dart';
import 'package:shamiri/app_constants/text_styles.dart';
import 'package:sizer/sizer.dart';

import '../../app_constants/colors.dart';

class LegendListItem extends StatelessWidget {
  final Color color;
  final String label;
  const LegendListItem({Key? key, required this.color, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Row(

        children: [
      Container(
        height: 1.5.w,
        width: 1.5.w,

        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle
        ),

      ),
      SizedBox(width: 1.0.w,),
      Text(label, style: paragraph2TextStyle.copyWith(color: greyTextColor),)

    ]);
  }
}
