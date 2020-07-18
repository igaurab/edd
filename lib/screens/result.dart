import 'package:edd/utils/processor.dart';
import 'package:edd/utils/result.dart' as _class;
import 'package:flutter/material.dart';

class Result extends StatefulWidget {
  @override
  _ResultState createState() => _ResultState();
}

class _ResultState extends State<Result> {
  _class.Result result;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    result = processor.getResult();
  }

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
        title: Text("Results"),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          height: double.maxFinite,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text(
                    "EDD: ",
                    style: TextStyle(
                        fontSize: 30.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    _class.result.EDDy.toString() +
                        " - " +
                        _class.result.EDDm.toString() +
                        " - " +
                        _class.result.EDDd.toString(),
                    style: TextStyle(
                        fontSize: 30.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Text(
                    "POG: ",
                    style: TextStyle(
                        fontSize: 32.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  Expanded(
                    child: Text(
                      _class.result.NoOfWeeks.toString() +
                          " weeks " +
                          _class.result.Remainder.toString() +
                          " days",
                      style: TextStyle(
                          fontSize: 32.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              Spacer(),
              SizedBox(
                width: double.maxFinite,
                height: 50.0,
                child: RaisedButton(
                  color: Colors.blueAccent,
                  child: Text(
                    "Back",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1.1),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//  print("NoOfDays $NoOfDays");
//     print("ByDated $BYDATEd");
//     print("ByDatem $BYDATEm");
//     print("NoOfWeeks $NoOfWeeks");
//     print("Remainder $Remainder");
//   }
