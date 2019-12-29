import 'package:flutter/material.dart';

class TrailEndScreen extends StatefulWidget {
  TrailEndScreen({Key key}) : super(key: key);

  @override
  _TrailEndScreenState createState() => _TrailEndScreenState();
}

class _TrailEndScreenState extends State<TrailEndScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
            child: Column(
              children: <Widget>[
                Text(
                  "Your Trail Period has expired,",
                  style: TextStyle(color: Colors.redAccent),
                ),
                Text(
                    "Please support app developers by purchasing the application.\n"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
