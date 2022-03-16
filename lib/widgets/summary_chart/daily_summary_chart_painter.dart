
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shamiri/app_constants/colors.dart';
import 'package:sizer/sizer.dart';

class DailySummaryChartPainter extends CustomPainter{
  final mentalPercent;
  final satisfactionPercent;
  final socialPercent;
  final workPercent;
  final purposePercent;
  final bool isLarge;

  DailySummaryChartPainter(this.mentalPercent, this.satisfactionPercent, this.socialPercent, this.workPercent, this.purposePercent, this.isLarge);
  @override
  void paint(Canvas canvas, Size size) {
   Paint mentalHealthCircle = Paint()
       ..strokeWidth = 7.0
       ..color = indicatorBackground
       ..style = PaintingStyle.stroke;
   Paint satisfactionCircle = Paint()
     ..strokeWidth = 7.0
     ..color = indicatorBackground
     ..style = PaintingStyle.stroke;
   Paint socialSupportCircle = Paint()
     ..strokeWidth = 7.0
     ..color = indicatorBackground
     ..style = PaintingStyle.stroke;
   Paint workCircle = Paint()
     ..strokeWidth = 7.0
     ..color = indicatorBackground
     ..style = PaintingStyle.stroke;
   Paint purposeCircle = Paint()
     ..strokeWidth = 7.0
     ..color = indicatorBackground
     ..style = PaintingStyle.stroke;

   Paint mentalHealthArc = Paint()
       ..strokeWidth =7.0
       ..color = const Color(0xfff9e9e7)
       ..style = PaintingStyle.stroke;
   Paint satisfactionArc = Paint()
     ..strokeWidth =7.0
     ..color =  const Color(0xffe3a89f)
     ..style = PaintingStyle.stroke;
   Paint socialSupportArc = Paint()
     ..strokeWidth = 7.0
     ..color =  const Color(0xffbcd9d1)
     ..style = PaintingStyle.stroke;
   Paint workArc = Paint()
     ..strokeWidth =7.0
     ..color =  const Color(0xff85bda5)
     ..style = PaintingStyle.stroke;
   Paint purposeArc = Paint()
     ..strokeWidth = 7.0
     ..color =  const Color(0xff143039)
     ..style = PaintingStyle.stroke;


   Offset center = Offset(size.width/2,size.height/2);
   double mentalHealthRadius = isLarge ? 10.h :8.h;
   double satisfactionRadius = isLarge ?9.h :7.h;
   double socialSupportRadius = isLarge ? 8.h:6.h;
   double workRadius = isLarge ?7.h:5.h;
   double purposeRadius = isLarge ?6.h:4.h;

   canvas.drawCircle(center, mentalHealthRadius, mentalHealthCircle);
   canvas.drawCircle(center, satisfactionRadius, satisfactionCircle);
   canvas.drawCircle(center, socialSupportRadius, socialSupportCircle);
   canvas.drawCircle(center, workRadius, workCircle);
   canvas.drawCircle(center, purposeRadius, purposeCircle);

   double mentalangle = 2 * pi * (mentalPercent/100);
   double satisfactionangle = 2 * pi * (satisfactionPercent/100);
   double socialangle = 2 * pi * (socialPercent/100);
   double workangle = 2 * pi * (workPercent/100);
   double purposeangle = 2 * pi * (purposePercent/100);
   double startangle = pi/75;

   
   
   canvas.drawArc(Rect.fromCircle(center: center, radius: mentalHealthRadius), startangle, -mentalangle, false, mentalHealthArc);
   canvas.drawArc(Rect.fromCircle(center: center, radius: satisfactionRadius), startangle, -satisfactionangle, false, satisfactionArc);
   canvas.drawArc(Rect.fromCircle(center: center, radius: socialSupportRadius), startangle, -socialangle, false, socialSupportArc);
   canvas.drawArc(Rect.fromCircle(center: center, radius: workRadius), startangle, -workangle, false, workArc);
   canvas.drawArc(Rect.fromCircle(center: center, radius: purposeRadius), startangle, -purposeangle, false, purposeArc);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {


    return true;
  }
}