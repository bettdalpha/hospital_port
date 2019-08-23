import 'package:flutter/material.dart';
import 'package:hospital_app/protos/generated/cancers.pb.dart';
import 'package:hospital_app/screens/home-page.dart';
import 'package:hospital_app/screens/hospital-dash.dart';
import 'package:hospital_app/utils/netutils/connect.dart';
import 'package:hospital_app/utils/wards-reader.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  wards = await CSVReader().getWards();
  prefs = await SharedPreferences.getInstance();
  runApp(MyApp());
}

SharedPreferences prefs;
final Connect connect = Connect(host: '35.204.122.168');
List<Ward> wards = [];

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    HospitalData activeHospital;
    if (prefs.containsKey('activeHospital')) {
      var string = prefs.getString('activeHospital');
      activeHospital = HospitalData.fromJson(string);
    }

    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xfff8bbf6),
        // primarySwatch: Colors.blue,
        appBarTheme: AppBarTheme(color: Color(0xFF801E48)),
        accentColor: Color(0xFF801E48),
      ),
      home: activeHospital == null
          ? ChooseUser()
          : HospitalDash(hospitalData: activeHospital),
    );
  }
}
