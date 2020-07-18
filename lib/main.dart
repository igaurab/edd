import 'package:edd/screens/home.dart';
import 'package:edd/screens/trailend.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DateTime now;
  bool access = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    now = new DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    if (now.year == 2020) {
      if (now.month <= 9) {
        setState(() {
          access = true;
        });
      } else {
        setState(() {
          access = false;
        });
      }
    }
    return access
        ? MaterialApp(
            debugShowCheckedModeBanner: false,
            home: HomeScreen(),
          )
        : MaterialApp(
            home: TrailEndScreen(),
          );
  }
}
