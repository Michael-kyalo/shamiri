import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../app_constants/colors.dart';

class HomeBody extends StatelessWidget {
  final Widget child;
  const HomeBody({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 90.h,
          width: 100.w,
          color: greenColor,
        ),
        Container(
          child: child,
          height: 90.h,
          width: 100.w,
          decoration: const BoxDecoration(
            color: backgroundColor,

            borderRadius:
            BorderRadius.only(topRight: Radius.circular(50)),
          ),
        ),
      ],
    );
  }
}
