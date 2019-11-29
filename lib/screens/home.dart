import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();
final GlobalKey<FormBuilderState> _todayKey = GlobalKey<FormBuilderState>();

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Edd By Date",
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.w600, fontSize: 20.0),
        ),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Column(
            children: <Widget>[
              text("Last Menstural Period"),
              lastMentrualPeriodDatePicker(),
              SizedBox(
                height: 30.0,
              ),
              text("Today's Date"),
              todayDatePicker(),
              SizedBox(
                height: 30.0,
              ),
              RaisedButton(
                color: Colors.blueAccent,
                onPressed: () {
                  print(_fbKey.currentState.value);
                  print(_todayKey.currentState.value);
                },
                child: Text(
                  "Submit",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget text(String str) {
  return Text(
    str,
    style: TextStyle(
        fontSize: 22.0, color: Colors.black, fontWeight: FontWeight.w600),
  );
}

Widget lastMentrualPeriodDatePicker() {
  return Row(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      Expanded(
        child: FormBuilder(
          key: _fbKey,
          child: Column(
            children: <Widget>[
              FormBuilderTextField(
                maxLines: 1,
                attribute: "lmpy",
                decoration: InputDecoration(labelText: "Year"),
                validators: [
                  FormBuilderValidators.numeric(),
                  FormBuilderValidators.max(4),
                  FormBuilderValidators.min(2),
                ],
              ),
              FormBuilderTextField(
                maxLines: 1,
                attribute: "lmpm",
                decoration: InputDecoration(labelText: "Month"),
                validators: [
                  FormBuilderValidators.numeric(),
                  FormBuilderValidators.max(2),
                  FormBuilderValidators.min(1),
                ],
              ),
              FormBuilderTextField(
                maxLines: 1,
                attribute: "lmpd",
                decoration: InputDecoration(labelText: "Day"),
                validators: [
                  FormBuilderValidators.numeric(),
                  FormBuilderValidators.max(2),
                  FormBuilderValidators.min(1),
                ],
              ),
            ],
          ),
        ),
      )
    ],
  );
}

Widget todayDatePicker() {
  return Row(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      Expanded(
        child: FormBuilder(
          key: _todayKey,
          child: Column(
            children: <Widget>[
              FormBuilderTextField(
                maxLines: 1,
                attribute: "today_y",
                decoration: InputDecoration(labelText: "Year"),
                validators: [
                  FormBuilderValidators.numeric(),
                  FormBuilderValidators.max(4),
                  FormBuilderValidators.min(1),
                ],
              ),
              FormBuilderTextField(
                maxLines: 1,
                attribute: "today_m",
                decoration: InputDecoration(labelText: "Month"),
                validators: [
                  FormBuilderValidators.numeric(),
                  FormBuilderValidators.max(2),
                  FormBuilderValidators.min(1),
                ],
              ),
              FormBuilderTextField(
                maxLines: 1,
                attribute: "today_d",
                decoration: InputDecoration(labelText: "Day"),
                validators: [
                  FormBuilderValidators.numeric(),
                  FormBuilderValidators.max(2),
                  FormBuilderValidators.min(1),
                ],
              ),
            ],
          ),
        ),
      )
    ],
  );
}
