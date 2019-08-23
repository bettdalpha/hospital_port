import 'package:hospital_app/main.dart';
import 'package:hospital_app/protos/generated/cancers.pbgrpc.dart';
import 'package:hospital_app/screens/patient-screen.dart';
import 'package:hospital_app/screens/widgets/nice-button.dart';
import 'package:hospital_app/utils/netutils/connect.dart';
import 'package:hospital_app/utils/reusable.dart';
import 'package:hospital_app/utils/wards-reader.dart';
import 'package:easy_dialog/easy_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class TreatmentPage extends StatefulWidget {
  Hospitals hospitals;
  @override
  _TreatmentPageState createState() => _TreatmentPageState();
}

class _TreatmentPageState extends State<TreatmentPage> {
  
  var searchTextController = TextEditingController();
  var treatmentController = TextEditingController();

  var treatmentCostController = TextEditingController();
  DateTime treatmentDate;
  // var searchTextController = TextEditingController();

  var focusNode = FocusNode();
  bool pull = false;

  @override
  Widget build(BuildContext context) {

    // var stream = Stream.fromFuture(Connect(host: 'localhost')
    //     .senderClient
    //     .getHospitals(Mess()..mess = searchTextController.text));

    return Scaffold(
      appBar: AppBar(
        title: Text('Treatment details'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 8),
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Container(
                child: TextFormField(
              controller: searchTextController,
              focusNode: focusNode,
              decoration: InputDecoration(
                  labelText: 'Search facility name',
                  border: OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () async {
                      pull = true;
                    },
                  )),
            )),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                  'Select the hospital you were treated to add treatment details'),
            ),
            FutureBuilder<Hospitals>(
                future: Connect(host: 'localhost').senderClient.getHospitals(
                      Mess()..mess = searchTextController.text,
                    ),
                builder: (context, snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.active:
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                      break;
                    case ConnectionState.waiting:
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                      break;
                    case ConnectionState.done:
                      return Container(
                        height: MediaQuery.of(context).size.height * 0.7,
                        child: ListView.builder(
                          itemBuilder: (context, idx) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black),
                                    borderRadius: BorderRadius.circular(8)),
                                child: ListTile(
                                  title:
                                      Text(snapshot.data.hospitals[idx].name),
                                  subtitle: Text(
                                      snapshot.data.hospitals[idx].wardinfo.county),
                                  onTap: () async {
                                    var userID = '';
                                    if (prefs.containsKey('userID')) {
                                      userID = prefs.getString('userID');
                                      print('UserID found as $userID');
                                    } else {
                                      await EasyDialog(
                                        title: Text(
                                            'You have not registered\n Press register button below to register your details'),
                                        contentList: [
                                          NiceButton(
                                            title:
                                                'Enter your patient information',
                                            todo: () async {
                                              if (connect.canConnect) {
                                                print(
                                                    'Database can receive connections');
                                              } else {
                                                print('Database is offline');
                                              }
                                              List<Ward> wards =
                                                  await CSVReader().getWards();
                                              Navigator.pop(context);
                                              Navigator.pop(context);
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      PatientReportingScreen(
                                                    connect: connect,
                                                    wards: wards,
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        ],
                                      ).show(context);
                                    }
                                    // EasyDialog.
                                    await EasyDialog(
                                            contentList: [
                                          Text(
                                              'Which treatment type were you given ?'),
                                          DynamicInput(
                                            hint:
                                                'radiation,physiotherapy ... ',
                                            label: 'Treatment type',
                                            controller: treatmentController,
                                            hasborder: true,
                                            type: DataType.TEXT,
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                              'What was the cost of treatment in KSH ?'),
                                          DynamicInput(
                                            hint: 'Cost of medication ',
                                            label: 'Cost',
                                            controller: treatmentCostController,
                                            hasborder: true,
                                            type: DataType.INTEGER,
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text('Add date of treatment'),
                                          NiceButton(
                                            title: 'Select Date',
                                            todo: () async {
                                              DatePicker.showDatePicker(
                                                context,
                                                onConfirm: (datetime) {
                                                  print(datetime);
                                                },
                                              );
                                            },
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          NiceButton(
                                            title: 'Submit Information',
                                            todo: () async {
                                              var userID;
                                              if (prefs.containsKey('userID')) {
                                                userID =
                                                    prefs.getString('userID');
                                              } else {
                                                await EasyDialog(
                                                  title: Text(
                                                      'You have not registered\n Press register button below to register your details'),
                                                  contentList: [
                                                    NiceButton(
                                                      title:
                                                          'Enter your patient information',
                                                      todo: () async {
                                                        if (connect
                                                            .canConnect) {
                                                          print(
                                                              'Database can receive connections');
                                                        } else {
                                                          print(
                                                              'Database is offline');
                                                        }
                                                        List<Ward> wards =
                                                            await CSVReader()
                                                                .getWards();
                                                        Navigator.pop(context);
                                                        Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                            builder: (context) =>
                                                                PatientReportingScreen(
                                                              connect: connect,
                                                              wards: wards,
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                  ],
                                                ).show(context);
                                              }
                                              var treatment = TreatmentDetails()
                                                ..patientID = userID
                                                ..hospitalID = snapshot
                                                    .data.hospitals[idx].guid
                                                ..treatment =
                                                    treatmentController.text
                                                ..cost = int.parse(
                                                    treatmentCostController
                                                        .text)
                                                ..date = treatmentDate
                                                    .toIso8601String();
                                              var insResponse = await connect
                                                  .senderClient
                                                  .addTreatment(treatment);
                                              if (insResponse.status ==
                                                  Status.OK) {
                                                Navigator.pop(context);
                                                EasyDialog(
                                                        title: Text('Response'),
                                                        description: Text(
                                                            'Records inserted successfully'))
                                                    .show(context);
                                              } else {
                                                Navigator.pop(context);
                                                EasyDialog(
                                                        title: Text('Response'),
                                                        description: Text(
                                                            'Records could not be inserted. Try again'))
                                                    .show(context);
                                              }
                                            },
                                          ),
                                        ],
                                            height: 400,
                                            description: Text(
                                                'Add your treatment details'),
                                            title: Text(snapshot
                                                .data.hospitals[idx].name),
                                            titlePadding: EdgeInsets.all(8.0))
                                        .show(context);
                                  },
                                ),
                              ),
                            );
                          },
                          itemCount: snapshot.data.hospitals.length,
                        ),
                      );
                    default:
                      return Center(child: CircularProgressIndicator());
                  }
                })
          ],
        ),
      ),
    );
  }
}
