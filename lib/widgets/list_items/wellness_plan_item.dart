import 'package:flutter/material.dart';
import 'package:shamiri/app_constants/colors.dart';
import 'package:shamiri/app_constants/text_styles.dart';
import 'package:sizer/sizer.dart';

class WellnessPlanItem extends StatelessWidget {
  const WellnessPlanItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          width: 25.w,
          height: 15.h,
          margin: const EdgeInsets.only(left: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Veronica",
                style:
                    paragraph2TextStyle.copyWith(fontWeight: FontWeight.w600),
              ),
              Text(
                "Shamiri Licensed Counselor",
                style: paragraph2TextStyle.copyWith(
                    fontWeight: FontWeight.w600, fontSize: 6),
              )
            ],
          ),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            color: Colors.blue,
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage("assets/images/image.jpeg"),
            ),
          ),
        ),
        Positioned(
            bottom: 30,
            child: Container(
              height: 5.h,
              width: 28.w,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                colors: [
                  whiteColor.withOpacity(0.5),
                  whiteColor.withOpacity(0.3),
                  whiteColor.withOpacity(0.1),
                ],
              )),
            ))
      ],
    );
  }
}
