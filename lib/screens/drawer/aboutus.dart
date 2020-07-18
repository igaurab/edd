import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: Text("About Us", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text("Developed by Gaurab Panthee and Shailesh Panthee"),
            SizedBox(
              height: 10.0,
            ),
            Text("Contact: pantheedevelopers@gmail.com"),
            SizedBox(
              height: 10.0,
            ),
            Text(
                "Are you happy with the app? You can encourage app developers by making a donation of any amount via esewa or khalti. \n"),
            Text("esewa: +977-9843315186"),
            Text("khalti: +977-9813851438"),
          ],
        ),
      ),
    );
  }
}
