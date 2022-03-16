import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shamiri/app_constants/colors.dart';
import 'package:shamiri/widgets/custom_app_bar.dart';
import 'package:shamiri/widgets/custom_tab_bar.dart';
import 'package:shamiri/widgets/weekly_dashboard.dart';
import 'package:sizer/sizer.dart';

import '../widgets/daily_dashboard.dart';

class DashBoardDetails extends StatefulWidget {
  const DashBoardDetails({Key? key}) : super(key: key);

  @override
  State<DashBoardDetails> createState() => _DashBoardDetailsState();
}

class _DashBoardDetailsState extends State<DashBoardDetails> {
  bool isDay = true;
  var weekday = DateTime.now().weekday;


  @override
  Widget build(BuildContext context) {
    var startdate =  DateTime.now().subtract(Duration(days: weekday)) ;
    return Scaffold(
      backgroundColor: backgroundColor,
      body: ListView(
        children: [
          CustomAppBar(
              title: isDay
                  ? '${DateFormat.EEEE().format(DateTime.now())} ${DateFormat.yMMMd().format(DateTime.now())}'
                  :  "${ DateFormat.MMMd().format(startdate) } - ${DateFormat.yMMMd().format(startdate.add(const Duration(days:  7))) }"),
          Padding(
              padding: const EdgeInsets.only(right: 30, left: 30, top: 10),
              child: CustomTabBar(
                isDay: isDay,
                onTapDaily: () {
                  setState(() {
                    isDay = true;
                  });
                },
                onTapWeekly: (){
                  setState(() {
                    isDay = false;
                  });
                },
              )),
          SizedBox(
            height: 2.h,
          ),
          isDay ? const DailyDashboard() : const WeeklyDashboard()
        ],
      ),
    );
  }
}
