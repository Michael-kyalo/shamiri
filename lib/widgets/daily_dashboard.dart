import 'package:flutter/material.dart';
import 'package:shamiri/app_constants/colors.dart';
import 'package:shamiri/models/gauge.dart';
import 'package:shamiri/widgets/list_items/gauge_list_item.dart';
import 'package:shamiri/widgets/summary_chart/daily_summary_chart.dart';
import 'package:sizer/sizer.dart';

class DailyDashboard extends StatelessWidget {
  const DailyDashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var gauges = <Gauge>[
      Gauge(mentalHealthColor, "Mental Health", 1),
      Gauge(satisfactionColor, "Satisfaction", 6),
      Gauge(socialSupportColor, 'Family/Social support', 2),
      Gauge(workColor, 'Work', 9),
      Gauge(purposeColor, 'Sense of purpose', 6),
    ];
    return Column(
      children: [
        SizedBox(
          height: 12.h,
        ),
        const DailySummaryChart(
          isLarge: true,
        ),
        SizedBox(
          height: 12.h,
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            height: 40.h,
            padding: const EdgeInsets.all(10.0),
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => GaugeListItem(
                gauge: gauges[index],
              ),
              itemCount: gauges.length,
            ),
            decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                      color: greyTextColor.withOpacity(0.5),
                      blurRadius: 0.5
                  )
                ]
            ),
          ),
        )
      ],
    );
  }
}
