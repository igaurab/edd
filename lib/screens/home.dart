import 'package:edd_by_date_calculator/screens/result.dart';
import 'package:edd_by_date_calculator/utils/processor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:page_transition/page_transition.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  GlobalKey<FormBuilderState> _fbKey;
  GlobalKey<FormBuilderState> _todayKey;

  @override
  void initState() {
    super.initState();

    _fbKey = GlobalKey<FormBuilderState>();
    _todayKey = GlobalKey<FormBuilderState>();
  }

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
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                text("Last Menstural Period"),
                lastMentrualPeriodDatePicker(key: _fbKey),
                SizedBox(
                  height: 30.0,
                ),
                text("Today's Date"),
                todayDatePicker(key: _todayKey),
                SizedBox(
                  height: 30.0,
                ),
                RaisedButton(
                  color: Colors.blueAccent,
                  onPressed: () {
                    if (_fbKey.currentState.saveAndValidate() &&
                        _todayKey.currentState.saveAndValidate()) {
                      processor.initializeProcessor(
                          lastMensturalPeriod: _fbKey.currentState.value,
                          todayDate: _todayKey.currentState.value);
                      processor.passValue();
                      Navigator.push(
                          context,
                          PageTransition(
                              type: PageTransitionType.fade, child: Result()));
                    }
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

Widget lastMentrualPeriodDatePicker({key}) {
  return Row(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      Expanded(
        child: FormBuilder(
          key: key,
          autovalidate: true,
          child: Column(
            children: <Widget>[
              FormBuilderTextField(
                maxLines: 1,
                attribute: "lmpy",
                decoration: InputDecoration(labelText: "Year"),
                validators: [
                  FormBuilderValidators.numeric(),
                  FormBuilderValidators.maxLength(4),
                  FormBuilderValidators.minLength(2),
                ],
              ),
              FormBuilderTextField(
                maxLines: 1,
                attribute: "lmpm",
                decoration: InputDecoration(labelText: "Month"),
                validators: [
                  FormBuilderValidators.numeric(),
                  FormBuilderValidators.maxLength(2),
                  FormBuilderValidators.minLength(1),
                ],
              ),
              FormBuilderTextField(
                maxLines: 1,
                attribute: "lmpd",
                decoration: InputDecoration(labelText: "Day"),
                validators: [
                  FormBuilderValidators.numeric(),
                  FormBuilderValidators.maxLength(2),
                  FormBuilderValidators.maxLength(1),
                ],
              ),
            ],
          ),
        ),
      )
    ],
  );
}

Widget todayDatePicker({key}) {
  return Row(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      Expanded(
        child: FormBuilder(
          key: key,
          child: Column(
            children: <Widget>[
              FormBuilderTextField(
                maxLines: 1,
                attribute: "today_y",
                decoration: InputDecoration(labelText: "Year"),
                validators: [
                  FormBuilderValidators.numeric(),
                  FormBuilderValidators.maxLength(4),
                  FormBuilderValidators.minLength(1),
                ],
              ),
              FormBuilderTextField(
                maxLines: 1,
                attribute: "today_m",
                decoration: InputDecoration(labelText: "Month"),
                validators: [
                  FormBuilderValidators.numeric(),
                  FormBuilderValidators.maxLength(2),
                  FormBuilderValidators.minLength(1),
                ],
              ),
              FormBuilderTextField(
                maxLines: 1,
                attribute: "today_d",
                decoration: InputDecoration(labelText: "Day"),
                validators: [
                  FormBuilderValidators.numeric(),
                  FormBuilderValidators.maxLength(2),
                  FormBuilderValidators.minLength(1),
                ],
              ),
            ],
          ),
        ),
      )
    ],
  );
}
