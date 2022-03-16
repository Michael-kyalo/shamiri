import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../app_constants/colors.dart';
import '../models/LegendItem.dart';
import '../widgets/custom_card.dart';
import '../widgets/home_body.dart';
import '../widgets/home_calendar_widget.dart';
import '../widgets/list_items/legend_item.dart';
import '../widgets/list_items/wellness_plan_item.dart';
import '../widgets/summary_chart/daily_summary_chart.dart';
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final legendList =  <LegendItem>[
    LegendItem( mentalHealthColor, 'Mental Health'),
    LegendItem(satisfactionColor,  'Satisfaction'),
    LegendItem(socialSupportColor,  'Family/ Social support'),
    LegendItem(workColor, 'Work'),
    LegendItem(purposeColor,  'Sense of purpose'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            HomeCalender(
              focusedDate: DateTime.now(),
            ),
            HomeBody(
                child: Padding(
                  padding: const EdgeInsets.only(top: 10, right: 20, left: 20),
                  child: ListView(
                    children: [
                      CustomCard(
                        title: "TODAY",
                        child: SizedBox(
                          height: 20.h,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [SizedBox(
                              width: 10.w,
                            ),
                              const DailySummaryChart(),
                              SizedBox(
                                width: 18.w,
                              ),
                              SizedBox(
                                  height: 10.h,
                                  width: 40.w,
                                  child: ListView.builder(
                                    itemBuilder: (context, index) =>
                                        LegendListItem(
                                          label: legendList[index].title,
                                          color: legendList[index].color,
                                        ),
                                    itemCount: legendList.length,
                                  ))
                            ],
                          ),
                        ),
                        action: "More",
                      ),
                      SizedBox(height: 2.h,),
                      CustomCard(title: 'Your wellness plan', child: SizedBox(
                        height: 20.h,
                        child: SizedBox(
                          width: 90.w,
                          height: 15.h,
                          child: ListView.builder(scrollDirection: Axis.horizontal,itemBuilder: (context, index) => const WellnessPlanItem(), itemCount: 2,),
                        ),
                      ), action: 'More')
                    ],
                  ),
                )),
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}