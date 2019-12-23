import "package:flutter/material.dart";

class Disclaimer extends StatelessWidget {
  final String text1 =
      "This App calculates POG by subtracting LMP from Today's date. The result so obtained in month and days is converted into days and then into weeks. Other methods commonly used by obstetricians like counting 4 weeks for every month and 13 weeks for every 3 months may give different result and is less accurate. Considerations need to be taken";
  final String text2 =
      "This App is made for educational purposes. This App may not be relied upon for the purposes of medical diagnosis or treatment. The information on this App is not a substitute for professional medical advice, diagnosis or treatment.";
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
        title: Text("Disclaimer", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              Container(
                child: Text(text1),
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                child: Text(text2),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
