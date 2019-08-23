import 'package:hospital_app/main.dart';
import 'package:hospital_app/protos/generated/cancers.pbgrpc.dart';
import 'package:hospital_app/screens/treatment.dart';
import 'package:hospital_app/screens/widgets/nice-button.dart';
import 'package:flutter/material.dart';

class UserScreen extends StatelessWidget {
  final PatientData patient;

  UserScreen({@required this.patient});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: <Widget>[
          RaisedButton.icon(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {
              prefs.remove('user');
            },
            color: Color(0xFF801E48),
            label: Text('Logout'),
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 5,
            ),
            createUserContainer(patient),
            SizedBox(height: 20,),
            NiceButton(
              title: 'Add treatment information',
              todo: () async {
                if (connect.canConnect) {
                  print('Database can receive connections');
                } else {
                  print('Database is offline');
                }
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TreatmentPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget createUserContainer(PatientData patient) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(7.0)),
      padding: EdgeInsets.all(8),
      child: Row(
        children: <Widget>[
          Flexible(
            flex: 1,
            child: CircleAvatar(
              child: Icon(
                Icons.account_circle,
                size: 90,
              ),
              radius: 45,
            ),
          ),
          Flexible(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  RichText(
                    text: TextSpan(
                        text: 'Names: ',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                        children: [
                          TextSpan(
                            text:
                                '\t\t${patient.person.firstname} ${patient.person.lastname} ',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w400),
                          ),
                        ]),
                  ),
                  RichText(
                    text: TextSpan(
                        text: 'Cancer: ',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                        children: [
                          TextSpan(
                            text:
                                '\t\t${patient.person.firstname} ${patient.person.lastname} ',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w400),
                          ),
                        ]),
                  ),
                  RichText(
                    text: TextSpan(
                        text: 'Location:',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                        children: [
                          TextSpan(
                            text:
                                '\t\t${patient.person.wardname.county} ${patient.person.wardname.constituency},${patient.person.wardname.wardname} ',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 13,
                                fontWeight: FontWeight.w400),
                          ),
                        ]),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
