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
      body: Column(
        children: <Widget>[
          Text(
            _class.result.BYDATEd.toString(),
          ),
          Text(
            _class.result.BYDATEm.toString(),
          ),
          Text(
            _class.result.NoOfDays.toString(),
          ),
          Text(
            _class.result.NoOfWeeks.toString(),
          ),
        ],
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
