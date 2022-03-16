import 'package:flutter/material.dart';
import 'package:shamiri/app_constants/colors.dart';
import 'package:shamiri/app_constants/text_styles.dart';
import 'package:shamiri/screens/dashboard_details_screen.dart';
import 'package:sizer/sizer.dart';
class CustomCard extends StatelessWidget {
  final String title;
  final Widget child;
  final String action;
  const CustomCard({Key? key, required this.title, required this.child, required this.action}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
  
      padding: const EdgeInsets.all(20),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: paragraph1TextStyle.copyWith(color: greyTextColor ),),
          SizedBox(height: 1.h,),
          child,
          GestureDetector(
            onTap: ()=> Navigator.of(context).push(MaterialPageRoute(builder: (context) => const DashBoardDetails())),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(action,style: paragraph1TextStyle.copyWith(color:greyTextColor)),
                const Icon(Icons.chevron_right, color: greyTextColor,),
              ],
            ),
          ),

        ],
      ),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: greyTextColor.withOpacity(0.5),
            blurRadius: 0.5
          )
        ]
      ),
    );
  }
}
