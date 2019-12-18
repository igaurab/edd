import 'package:edd_by_date_calculator/utils/processor.dart';
import 'package:edd_by_date_calculator/utils/result.dart' as _class;
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
        centerTitle: true,
        title: Text("Results"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
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
