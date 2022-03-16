import 'package:flutter/material.dart';

import '../../app_constants/text_styles.dart';
import 'daily_summary_chart_painter.dart';

class DailySummaryChart extends StatelessWidget {
  final bool isLarge;
  const DailySummaryChart({Key? key, this.isLarge = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      foregroundPainter:
      DailySummaryChartPainter(10, 30, 20, 70, 60,isLarge),
      child: Center(
        child: Text(
          "50",
          style: display2TextStyle.copyWith(color: Colors.black),
        ),
      ),
    );
  }
}
