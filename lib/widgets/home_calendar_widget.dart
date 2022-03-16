import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:shamiri/app_constants/colors.dart';
import 'package:shamiri/app_constants/text_styles.dart';
import 'package:sizer/sizer.dart';
import 'package:table_calendar/table_calendar.dart';
import 'dart:math' as math;
import '../app_constants/svg_strings.dart';

class HomeCalender extends StatefulWidget {
  final bool expand;
  final DateTime focusedDate;

  const HomeCalender({Key? key, this.expand = false, required this.focusedDate})
      : super(key: key);

  @override
  State<HomeCalender> createState() => _HomeCalenderState();
}

class _HomeCalenderState extends State<HomeCalender> {
  late DateTime firstDay, lastDay, focusedDay;
  late bool isExpanded;

  @override
  void initState() {
    firstDay = DateTime(1990);
    lastDay = DateTime(2100);
    focusedDay = widget.focusedDate;
    isExpanded = widget.expand;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print("change");
    }
    return Container(
      width: 100.w,
      height: isExpanded ? 70.h : 40.h,
      padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 2.h,
          ),
          Text(
            "For You",
            style: display2TextStyle,
          ),
          SizedBox(
            height: 1.h,
          ),
          Text(
            '${DateFormat.yMMMd().format(focusedDay)}, ${DateFormat.EEEE().format(focusedDay)}',
            style: paragraph1TextStyle,
          ),
          SizedBox(
            height: 1.h,
          ),
          Container(
            padding: const EdgeInsets.all(10.0),
            decoration: const BoxDecoration(
              color: lightGreenColor,
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
            child: TableCalendar(
              focusedDay: focusedDay,
              firstDay: firstDay,
              lastDay: lastDay,
              rowHeight: 7.h,
              calendarBuilders: CalendarBuilders(
                dowBuilder: (context, start) => Center(
                    child: Text(
                  DateFormat.EEEE().format(start)[0],
                  style: paragraph3TextStyle,
                )),
                defaultBuilder: (context, start, end) => Column(
                  children: [
                    Text(
                      DateFormat.d().format(start),
                      style: paragraph3TextStyle,
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Container(
                      height: 7.w,
                      width: 7.w,
                      decoration: const BoxDecoration(
                          color: whiteColor,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey,
                                offset: Offset(1, 1),
                                blurRadius: 0.5),
                            BoxShadow(
                                color: Colors.grey,
                                offset: Offset(-1, 1),
                                blurRadius: 0.5)
                          ]),
                    )
                  ],
                ),
                todayBuilder: (context, start, end) => Container(
                  decoration: const BoxDecoration(color: greenColor, borderRadius: BorderRadius.all(Radius.circular(15))),
                  child: Column(
                    children: [
                      Text(
                        DateFormat.d().format(start),
                        style: paragraph3TextStyle,
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Container(
                        height: 7.w,
                        width: 7.w,
                        decoration: const BoxDecoration(
                            color: Colors.yellow,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey,
                                  offset: Offset(1, 1),
                                  blurRadius: 0.5),
                              BoxShadow(
                                  color: Colors.grey,
                                  offset: Offset(-1, 1),
                                  blurRadius: 0.5)
                            ]),
                        child: SvgPicture.string(frowningBlue,fit: BoxFit.fill,),
                      )
                    ],
                  ),
                ),
              ),
              headerStyle: HeaderStyle(
                titleTextFormatter: (start,dynamic) {
                  var weekday = start.weekday;

                  var startdate =  start.subtract(Duration(days: isExpanded ?start.day-1 : weekday)) ;
                  return  "${ DateFormat.MMMd().format(startdate) } - ${DateFormat.yMMMd().format(startdate.add(Duration(days: isExpanded ? 30 : 6))) }";
                } ,
                formatButtonVisible: false,
                titleCentered: true,
                leftChevronIcon: const Icon(
                  Icons.chevron_left,
                  color: whiteColor,
                ),
                titleTextStyle: paragraph2TextStyle,
                rightChevronIcon: const Icon(
                  Icons.chevron_right,
                  color: whiteColor,
                ),
              ),
              daysOfWeekStyle: DaysOfWeekStyle(
                  weekdayStyle: paragraph3TextStyle,
                  weekendStyle: paragraph3TextStyle),
              calendarFormat:
                  isExpanded ? CalendarFormat.month : CalendarFormat.week,
            ),
          ),
          SizedBox(
            height: 2.h,
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: GestureDetector(
              onTap: ()=> setState(() {
                isExpanded = !isExpanded;
              }),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    isExpanded ? "Show Less" : "Show More",
                    style: paragraph1TextStyle,
                    textAlign: TextAlign.end,
                  ),
                  Transform.rotate(angle: isExpanded? -math.pi/2  : math.pi/2,
                  child: const Icon(Icons.chevron_right, color: whiteColor,))
                  
                ],
              ),
            ),
          ),

        ],
      ),
      decoration: const BoxDecoration(
          color: greenColor,
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50))),
    );
  }
}
