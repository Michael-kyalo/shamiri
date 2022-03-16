import 'package:flutter/material.dart';
import 'package:shamiri/app_constants/colors.dart';
import 'package:shamiri/models/gauge.dart';
import 'package:sizer/sizer.dart';

import '../../app_constants/text_styles.dart';

class GaugeListItem extends StatelessWidget {
  final Gauge gauge;

  const GaugeListItem({Key? key, required this.gauge}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text(gauge.title, style: paragraph2TextStyle.copyWith(color: greyTextColor),), Text('${gauge.progress.ceil()}/10',style: paragraph2TextStyle.copyWith(color: greyTextColor)),],
          ),
          SizedBox(height: 1.5.h,),
          LinearProgressIndicator(
            minHeight: 11,
            color: gauge.color,
            backgroundColor: whiteColor,
            value: (gauge.progress) / 10,
          )
        ],
      ),
    );
  }
}
