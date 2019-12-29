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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Text("Developed by Shailesh Panthee"),
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              child: Text("Contact: shaileshpanthee@gmail.com"),
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
