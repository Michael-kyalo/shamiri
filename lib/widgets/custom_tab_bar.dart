import 'package:flutter/material.dart';
import 'package:shamiri/app_constants/colors.dart';
import 'package:shamiri/app_constants/text_styles.dart';
import 'package:sizer/sizer.dart';
class CustomTabBar extends StatelessWidget {
  final bool isDay;
  final Function() onTapDaily;
  final Function() onTapWeekly;
  const CustomTabBar({Key? key, required this.isDay, required this.onTapDaily, required this.onTapWeekly}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(

      height: 40,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: onTapDaily,
            child: Container(
              height: 30,
              width: 35.w,
              child: Center(child: Text("Daily", style: paragraph2TextStyle.copyWith(color: Colors.black),)),
              decoration: BoxDecoration(
                color: isDay ? whiteColor : mentalHealthColor,
                  borderRadius: const BorderRadius.all(Radius.circular(30))
              ),
            ),
          ),
          GestureDetector(
            onTap: onTapWeekly,
            child: Container(
              height: 30,
              width: 35.w,
              child: Center(child: Text("Weekly", style: paragraph2TextStyle.copyWith(color: Colors.black),)),
              decoration: BoxDecoration(
                  color: isDay ? mentalHealthColor : whiteColor,
                  borderRadius: const BorderRadius.all(Radius.circular(30))
              ),
            ),
          )
        ],
      ),
      decoration: const BoxDecoration(
        color: mentalHealthColor,
        borderRadius: BorderRadius.all(Radius.circular(30))
      ),
    );
  }
}
