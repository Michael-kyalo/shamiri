import 'package:flutter/material.dart';
import 'package:shamiri/screens/home_screen.dart';

import 'package:sizer/sizer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //use sizer to allow smooth resizing of text and dimens across various screen sizes
    return Sizer(builder: (context, orientation, deviceType) {
      return const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MyHomePage(title: 'Flutter Demo Home Page'),
      );
    });
  }
}
