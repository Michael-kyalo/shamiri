import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shamiri/app_constants/colors.dart';
import 'package:shamiri/app_constants/svg_strings.dart';
import 'package:shamiri/app_constants/text_styles.dart';
import 'package:shamiri/models/daily_data_point.dart';
import 'package:shamiri/widgets/weekly_chart_painter.dart';
import 'package:sizer/sizer.dart';

class WeeklyChart extends StatelessWidget {
  final String title;
  final List<DataPoint> data;
  final double goal;
  final double percentage;

  const WeeklyChart(
      {Key? key,
      required this.title,
      required this.data,
      required this.goal,
      required this.percentage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      padding: EdgeInsets.all(20.sp),
      decoration: const BoxDecoration(
        color: backgroundColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            title,
            style: paragraph3TextStyle.copyWith(color: Colors.black),
          ),
          SizedBox(
            height: 2.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              chartRowItem("Weekly average", '6', false),
              chartRowItem("Weekly-over-week", '20%', true),
              chartRowItem("Goal", '6', false),
            ],
          ),
          SizedBox(
            height: 20.h,
          ),
          CustomPaint(
            child: Container(
              width: 100.w,
            ),
            painter: WeeklyChartPainter(data),
          )
        ],
      ),
    );
  }

  Widget chartRowItem(String label, String value, bool isExpanded) {
    var labelStyle =
        paragraph2TextStyle.copyWith(fontSize: 8.sp, color: greyTextColor);
    var valueStyle =
        paragraph2TextStyle.copyWith(fontSize: 20.sp, color: satisfactionColor);
    return SizedBox(
      height: 10.h,
      child: Column(
        children: [
          Text(
            label,
            style: labelStyle,
          ),
          SizedBox(height: 2.0.h,),
          isExpanded
              ? Row(

                  children: [
                    SvgPicture.string(arrowDown),
                    SizedBox(
                      width: 3.w,
                    ),
                    Text(
                      value,
                      style: valueStyle,
                    )
                  ],
                )
              : Text(
                  value,
                  style: valueStyle,
                )
        ],
      ),
    );
  }
}
