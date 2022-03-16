import 'package:flutter/material.dart';
import 'package:shamiri/models/daily_data_point.dart';
import 'package:shamiri/widgets/weekly_chart.dart';

class WeeklyDashboard extends StatelessWidget {
  const WeeklyDashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final data = <DataPoint>[
      DataPoint('S', 12), DataPoint('M', 1), DataPoint('T', 0), DataPoint('W', 10), DataPoint('T', 10), DataPoint('F', 10), DataPoint('S', 10),
    ];
    return Column(
      children: [
        WeeklyChart(title: "Mental Health", data: data, goal: 8, percentage: 20)
      ],
    );
  }
}
