import 'package:obgyn_complete/screens/home.dart';
import 'package:obgyn_complete/screens/trailend.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DateTime now;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    now = new DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
    // : MaterialApp(
    //     home: TrailEndScreen(),
    //   );
  }
}
