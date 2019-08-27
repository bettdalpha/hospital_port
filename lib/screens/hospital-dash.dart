import 'package:flutter/material.dart';
import 'package:hospital_app/protos/generated/cancers.pb.dart';
import 'package:hospital_app/screens/home-page.dart';

import '../main.dart';

class HospitalDash extends StatefulWidget {
  final HospitalData hospitalData;

  HospitalDash({@required this.hospitalData});

  @override
  _HospitalDashState createState() => _HospitalDashState();
}

class _HospitalDashState extends State<HospitalDash> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.hospitalData.hospitalname),
        centerTitle: true,
        actions: <Widget>[
          RaisedButton.icon(
            icon: Icon(Icons.exit_to_app),
            label: Text('Logout'),
            color: Color(0xFF801E48),
            onPressed: () {
              prefs.remove('activeHospital');
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => ChooseUser()));
            },
          )
        ],
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              createHospitalContainer(widget.hospitalData),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  children: <Widget>[
                    Text('Hospital Reports'),
                    Spacer(),
                    IconButton(
                      icon: Icon(Icons.refresh),
                      onPressed: () {
                        setState(() {});
                      },
                    )
                  ],
                ),
              ),
              FutureBuilder<FullHospitalReport>(
                future: connect.senderClient
                    .getHospitalReport(Mess()..mess = widget.hospitalData.guid),
                builder: (context, snapshotdata) {
                  switch (snapshotdata.connectionState) {
                    case ConnectionState.waiting:
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                      break;
                    case ConnectionState.active:
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                      break;
                    case ConnectionState.done:
                      if (snapshotdata.data == null) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: Text('No Patients Treated yet'),
                          ),
                        );
                      }
                      if (snapshotdata.data.reports.length == 0) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: Text('No Patients Treated yet'),
                          ),
                        );
                      }
                      return Container(
                        padding: EdgeInsets.all(15),
                        child: Column(
                          children: <Widget>[
                            for (HospitalReport report
                                in snapshotdata.data.reports)
                              createHospitalTileReport(report),
                            // SizedBox(height: 10,)
                          ],
                        ),
                      );
                    default:
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget createHospitalTileReport(HospitalReport report) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(7.0)),
        child: ListTile(
          title: Text(report.name),
          trailing: Text('${report.count}'),
        ),
      ),
    );
  }

  Widget createHospitalContainer(HospitalData hospital) {
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
                            text: '\t\t${hospital.hospitalname}',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w400),
                          ),
                        ]),
                  ),
                  RichText(
                    text: TextSpan(
                        text: 'Locality: ',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                        children: [
                          TextSpan(
                            text:
                                '${hospital.info.county},${hospital.info.constituency},${hospital.info.wardname},',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w400),
                          ),
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
