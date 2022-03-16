import 'package:flutter/material.dart';
import 'package:shamiri/app_constants/colors.dart';
import 'package:shamiri/models/daily_data_point.dart';
import 'package:sizer/sizer.dart';

class WeeklyChartPainter extends CustomPainter{
  final List<DataPoint> data;

  WeeklyChartPainter(this.data);
  @override
  void paint(Canvas canvas, Size size) {

    drawBackground(canvas,Offset(size.width/2,size.height/2));
    drawGridlines(canvas, size);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

  void drawBackground(Canvas canvas, Offset center) {
    var rect = Rect.fromCenter(center: center, width: 90.w, height: 40.h);

    Paint background = Paint()
    ..color = Colors.blue;

    canvas.drawRect(rect, background);
  }

  void drawGridlines(Canvas canvas, Size size) {

    var startPoint = Offset(size.width , -size.height);
    var endPoint = Offset(-(size.width + 1.w),-size.height);
    var maxPoint = 0.0;
    for (var point in data) {
      maxPoint = point.value > maxPoint ? point.value : maxPoint;
    }
    for(var i = 0; i < maxPoint + 1 ; i ++){
      startPoint += Offset(0,3.h);
      endPoint +=  Offset(0,3.h);
      if(i == 1){
        drawLine(canvas, startPoint,endPoint, color :Colors.red);
      }

      if(i == 4){
        drawLine(canvas, startPoint,endPoint, color :Colors.yellow);
      }
      drawLine(canvas, startPoint,endPoint);

    }

  }

  void drawLine(Canvas canvas, Offset startPoint, Offset endPoint,
      {color = greyTextColor}) {
    var linePaint = Paint()
      ..color = color
      ..strokeWidth = 2.0
      ..style = PaintingStyle.stroke;

    canvas.drawLine(startPoint, endPoint, linePaint);


  }
}