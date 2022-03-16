import 'package:flutter/material.dart';
import 'package:shamiri/app_constants/colors.dart';
import 'package:shamiri/app_constants/text_styles.dart';
import 'package:sizer/sizer.dart';
class CustomAppBar extends StatelessWidget {
  final String title;
  const CustomAppBar({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      padding: const EdgeInsets.all(10),
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(onTap:()=>Navigator.of(context).pop(),child: const Icon(Icons.chevron_left, color: greyTextColor,)),
          const Spacer(),
          Text(title, style: paragraph1TextStyle.copyWith(color: Colors.black),),
          const Spacer(),

        ],
      ),
      decoration: const BoxDecoration(
        color: backgroundColor,
        border: Border(bottom: BorderSide(color: greyTextColor)),
      ),
    );

  }
}
