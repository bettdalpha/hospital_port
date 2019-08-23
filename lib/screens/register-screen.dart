import 'package:hospital_app/protos/generated/cancers.pb.dart';
import 'package:hospital_app/screens/location-widget.dart';
import 'package:hospital_app/screens/patient-screen.dart';
import 'package:hospital_app/screens/user-screen.dart';
import 'package:hospital_app/screens/widgets/cancer-namepicker.dart';
import 'package:hospital_app/screens/widgets/nice-button.dart';
import 'package:hospital_app/screens/widgets/profession-picker.dart';
import 'package:hospital_app/utils/geolocation.dart';
import 'package:hospital_app/utils/reusable.dart';
import 'package:hospital_app/utils/wards-reader.dart';
import 'package:flutter/material.dart';
import 'package:hospital_app/main.dart';
import 'package:latlong/latlong.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:uuid/uuid.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var fnameController = TextEditingController();
  var lnameController = TextEditingController();
  var genderController = TextEditingController();
  var raceController = TextEditingController();
  var ethnicityController = TextEditingController();
  var professionController = TextEditingController();
  var tribeController = TextEditingController();
  var bloodGroupController = TextEditingController();
  var cancerNameController = TextEditingController();
  var originOrganController = TextEditingController();
  var originDateController = TextEditingController();
  var currentCancerStage = TextEditingController();
  var age = 0;
  int currentStep = 0;
  int cancerState = 0;
  final _formKey = GlobalKey<FormState>();
  Ward ward = Ward(county: '', constituency: '', ward: '');
  LatLng location;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register your details"),
      ),
      body: Form(
        key: _formKey,
        child: Container(
          child: Stepper(
            type: StepperType.horizontal,
            currentStep: currentStep,
            onStepContinue: () async {
              if (currentStep == 2) {
                if (_formKey.currentState.validate()) {
                  var rpclocation = Location()
                    ..lat = location.latitude
                    ..lon = location.longitude;
                  var wardInfo = WardInfo()
                    ..county = ward.county
                    ..constituency = ward.constituency
                    ..wardname = ward.ward;

                  var patient = Person()
                    ..firstname = fnameController.text
                    ..patientID = Uuid().v4()
                    ..lastname = lnameController.text
                    ..gender = genderController.text
                    ..birthplace = "Kenya"
                    ..bloodgroup = bloodGroupController.text
                    ..profession = professionController.text
                    ..location = rpclocation
                    ..wardname = wardInfo
                    ..age = age;
                  var cancer = Cancer()
                    ..cancertype = cancerNameController.text
                    ..originorgan = originOrganController.text
                    ..stage = cancerState
                    ..origindate = originDateController.text;

                  var patientData = PatientData()
                    ..person = patient
                    ..cancer = cancer;

                  String s = patientData.writeToJson();
                  prefs.setString('user', s);
                  var b = prefs.getString('user');
                  var pat = PatientData.fromJson(b);

                  // var res = await connect.senderClient.sendPatientData(pat);
                  // print(res);
                  
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => UserScreen(
                        patient: pat,
                      ),
                    ),
                  );
                }

                ///submit info
              } else if (currentStep == 1) {
                setState(() {
                  currentStep++;
                });
              } else if (currentStep == 0) {
                setState(() {
                  currentStep++;
                });
              }
            },
            onStepCancel: () {
              if (currentStep == 0) {
                Navigator.pop(context);
              } else if (currentStep == 1) {
                setState(() {
                  currentStep--;
                });
              } else if (currentStep == 2) {
                setState(() {
                  currentStep--;
                });
              }
            },
            onStepTapped: (i) {
              setState(() {
                currentStep = i;
              });
            },
            steps: [
              Step(
                title: Text('Info'),
                state: currentStep == 0 ? StepState.editing : StepState.indexed,
                content: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Names'),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      child: Row(
                        children: <Widget>[
                          Flexible(
                            child: DynamicInput(
                              label: 'First Name',
                              controller: fnameController,
                              hint: 'First name',
                              hasborder: true,
                              type: DataType.NAME,
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Flexible(
                            child: DynamicInput(
                              label: 'Last Name',
                              controller: lnameController,
                              hint: 'First name',
                              hasborder: true,
                              type: DataType.NAME,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text('Gender'),
                    DropdownButton<String>(
                      items: ["Male", "Female"]
                          .map(
                            (str) => DropdownMenuItem<String>(
                              child: Text(
                                '  $str  ',
                                textAlign: TextAlign.center,
                              ),
                              value: str,
                            ),
                          )
                          .toList(),
                      onChanged: (str) {
                        setState(() {
                          genderController.text = str;
                        });
                      },
                      hint: genderController.text == null
                          ? Text('Gender')
                          : Text(
                              '${genderController.text}',
                            ),
                      // value: tribeController.text == null ? 'Choose Tribe' : tribeController.text,
                    ),
                    SizedBox(height: 10),
                    Text('Age   '),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: <Widget>[
                        Flexible(
                          child: NiceButton(
                            title: 'Date of birth',
                            height: 45.0,
                            todo: () {
                              DatePicker.showDatePicker(
                                context,
                                currentTime: DateTime(1996),
                                onConfirm: (datetime) {
                                  age = ((DateTime.now()
                                          .difference(datetime)
                                          .inDays) ~/
                                      365);
                                },
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Text('Profession'),
                    ProfessionPicker(
                      controller: professionController,
                    ),
                    SizedBox(height: 10),
                    Text('Blood group   '),
                    DropdownButton<String>(
                      items: bloodgroups
                          .map(
                            (str) => DropdownMenuItem<String>(
                              child: Text(
                                '  $str  ',
                                textAlign: TextAlign.center,
                              ),
                              value: str,
                            ),
                          )
                          .toList(),
                      onChanged: (str) {
                        setState(() {
                          bloodGroupController.text = str;
                        });
                      },
                      hint: bloodGroupController.text == null
                          ? Text('Choose tribe')
                          : Text('${bloodGroupController.text}'),
                      // value: tribeController.text == null ? 'Choose Tribe' : tribeController.text,
                    ),
                  ],
                ),
              ),
              Step(
                title: Text('Cancer'),
                state: currentStep == 1
                    ? StepState.editing
                    : currentStep > 1 ? StepState.complete : StepState.disabled,
                content: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Enter your cancer details'),
                    SizedBox(height: 10),
                    CancerNamePicker(
                      controller: cancerNameController,
                    ),
                    SizedBox(height: 10),
                    Text('Cancer origin organ'),
                    SizedBox(height: 5),
                    DynamicInput(
                      controller: originOrganController,
                      hint: 'Organ causing cancer',
                      label: 'Origin of cancer',
                      hasborder: true,
                      type: DataType.TEXT,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text('Cancer discovery date'),
                    SizedBox(height: 5),
                    Padding(
                      padding: EdgeInsets.only(left: 8),
                      child: NiceButton(
                        title: 'Discovery Date',
                        todo: () {
                          DatePicker.showDatePicker(
                            context,
                            onConfirm: (datetime) {
                              originDateController.text =
                                  datetime.toIso8601String();
                            },
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 10),
                    Text('Cancer Stage'),
                    DropdownButton<int>(
                      items: List.generate(5, (i) => i + 1)
                          .map(
                            (stage) => DropdownMenuItem<int>(
                              child: Text('\t$stage\t'),
                              value: stage,
                            ),
                          )
                          .toList(),
                      onChanged: (stage) {
                        // setState(() {
                        //   cancerStage = stage;
                        // });
                        setState(() {
                          cancerState = stage;
                          currentCancerStage.text = '$stage';
                        });
                      },
                      hint: currentCancerStage.text == null
                          ? Text('Choose tribe')
                          : Text('${currentCancerStage.text}'),
                      // value: tribeController.text == null ? 'Choose Tribe' : tribeController.text,
                    ),
                  ],
                ),
              ),
              Step(
                title: Text('Location'),
                state: currentStep == 2
                    ? StepState.editing
                    : currentStep > 1 ? StepState.complete : StepState.disabled,
                content: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Choose your location particulars'),
                    SizedBox(height: 20),
                    LocChooser(
                      callback: (warde) {
                        ward.county = warde.county;
                        ward.constituency = warde.constituency;
                        ward.ward = warde.ward;
                        setState(() {});
                      },
                      ward: ward,
                      wards: wards,
                    ),
                    ward == null
                        ? Text('Location: ..,..,..')
                        : Text(
                            'Location: \t ${ward.county},${ward.constituency},${ward.ward}'),
                    SizedBox(
                      height: 20,
                    ),
                    Text('Your current location'),
                    NiceButton(
                      title: 'Press to locate you',
                      todo: () async {
                        var locat = await Geolocation().getLocation();
                        setState(() {
                          location = locat;
                        });
                        print(location);
                      },
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
