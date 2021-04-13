import 'package:nepali_date_picker/nepali_date_picker.dart';
import 'package:edd/screens/drawer/aboutus.dart';
import 'package:edd/screens/drawer/disclaimer.dart';
import 'package:edd/screens/drawer/donate.dart';
import 'package:edd/screens/drawer/usefulInfo.dart';
import 'package:edd/screens/result.dart';
import 'package:edd/utils/processor.dart';
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
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final String YEAR = 'year';
  final String MONTH = 'month';
  final String DAY = 'day';

  TextEditingController tyear;
  TextEditingController tmonth;
  TextEditingController tday;

  NepaliDateTime _selectedDateTime = NepaliDateTime.now();
  // bool showTodayDate = false;
  @override
  void initState() {
    super.initState();
    initialize();
  }

  void initialize() async {
    _fbKey = GlobalKey<FormBuilderState>();
    _todayKey = GlobalKey<FormBuilderState>();

    tyear = TextEditingController();
    tmonth = TextEditingController();
    tday = TextEditingController();

    tyear.text = _selectedDateTime.year.toString();
    tmonth.text = _selectedDateTime.month.toString();
    tday.text = _selectedDateTime.day.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(
          "Period of Gestation Calculator",
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.w600, fontSize: 20.0),
        ),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(
            Icons.menu,
            color: Colors.black,
          ),
          onPressed: () {
            _scaffoldKey.currentState.openDrawer();
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.calendar_today,
              color: Colors.black,
            ),
            onPressed: () async {
              _selectedDateTime = await showMaterialDatePicker(
                context: context,
                initialDate: NepaliDateTime.now(),
                firstDate: NepaliDateTime(2000),
                lastDate: NepaliDateTime(2090),
              );
              setState(() {
                tyear.text = _selectedDateTime.year.toString();
                tmonth.text = _selectedDateTime.month.toString();
                tday.text = _selectedDateTime.day.toString();
              });
            },
          )
        ],
      ),
      drawer: createDrawer(),
      body: Container(
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                text("Last Menstural Period"),
                lastMentrualPeriodDatePicker(key: _fbKey),
                SizedBox(
                  height: 30.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    text("Today's Date"),
                    // GestureDetector(
                    //   onTap: () {
                    //     setState(() {
                    //       showTodayDate = !showTodayDate;
                    //     });
                    //   },
                    //   child: showTodayDate ? Text("Hide") : Text("Show"),
                    // )
                  ],
                ),
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

  Drawer createDrawer() {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
              child: Text(
                "ObGyn Complete",
                style: TextStyle(
                    fontSize: 26.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              decoration: BoxDecoration(
                color: Colors.blueAccent,
              )),
          ListTile(
            title: Text('About us'),
            onTap: () {
              Navigator.push(
                  context,
                  PageTransition(
                      type: PageTransitionType.fade, child: AboutUs()));
            },
          ),
          ListTile(
            title: Text('Useful Info'),
            onTap: () {
              Navigator.push(
                  context,
                  PageTransition(
                      type: PageTransitionType.fade, child: UsefulInfo()));
            },
          ),
          ListTile(
            title: Text('Disclaimer'),
            onTap: () {
              Navigator.push(
                  context,
                  PageTransition(
                      type: PageTransitionType.fade, child: Disclaimer()));
            },
          ),
          ListTile(
            title: Text('Donate'),
            onTap: () {
              Navigator.push(
                  context,
                  PageTransition(
                      type: PageTransitionType.fade, child: Donate()));
            },
          ),
        ],
      ),
    );
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
            autovalidateMode: AutovalidateMode.always,
            child: Column(
              children: <Widget>[
                FormBuilderTextField(
                  maxLines: 1,
                  name: "lmpy",
                  decoration: InputDecoration(labelText: "Year"),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.numeric(context),
                    FormBuilderValidators.maxLength(context, 4),
                  ]),
                ),
                FormBuilderTextField(
                  maxLines: 1,
                  name: "lmpm",
                  decoration: InputDecoration(labelText: "Month"),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.numeric(context),
                    FormBuilderValidators.maxLength(context, 2),
                  ]),
                ),
                FormBuilderTextField(
                  maxLines: 1,
                  name: "lmpd",
                  decoration: InputDecoration(labelText: "Day"),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.numeric(context),
                    FormBuilderValidators.maxLength(context, 2),
                  ]),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget todayDatePicker({key}) {
    // initialize();
    return Opacity(
      opacity: /*showTodayDate*/ 1.0,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child: FormBuilder(
              key: key,
              child: Column(
                children: <Widget>[
                  FormBuilderTextField(
                    controller: tyear,
                    maxLines: 1,
                    name: "today_y",
                    decoration: InputDecoration(labelText: "Year"),
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.numeric(context),
                      FormBuilderValidators.maxLength(context, 4),
                    ]),
                  ),
                  FormBuilderTextField(
                    controller: tmonth,
                    maxLines: 1,
                    name: "today_m",
                    decoration: InputDecoration(labelText: "Month"),
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.numeric(context),
                      FormBuilderValidators.maxLength(context, 2),
                    ]),
                  ),
                  FormBuilderTextField(
                    controller: tday,
                    maxLines: 1,
                    name: "today_d",
                    decoration: InputDecoration(labelText: "Day"),
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.numeric(context),
                      FormBuilderValidators.maxLength(context, 2),
                    ]),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
