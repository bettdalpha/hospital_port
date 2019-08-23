import 'package:hospital_app/main.dart';
import 'package:hospital_app/protos/generated/cancers.pb.dart';
import 'package:hospital_app/protos/generated/cancers.pb.dart' as prefix0;
import 'package:hospital_app/screens/location-widget.dart';
import 'package:hospital_app/screens/widgets/cancer-namepicker.dart';
import 'package:hospital_app/screens/widgets/nice-button.dart';
import 'package:hospital_app/screens/widgets/profession-picker.dart';
import 'package:hospital_app/utils/geolocation.dart';
import 'package:hospital_app/utils/netutils/connect.dart';
import 'package:hospital_app/utils/reusable.dart';
import 'package:hospital_app/utils/wards-reader.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:latlong/latlong.dart';
import 'package:toast/toast.dart';
import 'package:uuid/uuid.dart';

class PatientReportingScreen extends StatefulWidget {

  final Connect connect;
  final List<Ward> wards;
  Ward ward;

  PatientReportingScreen({@required this.connect, this.wards});
  @override
  _PatientReportingScreenState createState() => _PatientReportingScreenState();
}

class _PatientReportingScreenState extends State<PatientReportingScreen> {
  var fnameController = TextEditingController();
  var lnameController = TextEditingController();
  var genderController = TextEditingController();
  var raceController = TextEditingController();
  var ethnicityController = TextEditingController();
  var professionController = TextEditingController();
  var tribeController = TextEditingController();
  var bloodGroupController = TextEditingController();

  var cancerNameController = TextEditingController();
  var cancerTumorController = TextEditingController();
  var originDateController = TextEditingController();
  var currentCancerStage = TextEditingController();

  WardInfo wardInfo = WardInfo();

  var location = LatLng(0, 0);
  int age = 0;
  int cancerStage = 0;

  bool isSubmitting = false;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {

    fnameController.text = faker.person.firstName();
    lnameController.text = faker.person.lastName();
    genderController.text = faker.randomGenerator.boolean() == true ? 'Male' : 'Female';
    cancerTumorController.text = faker.food.dish();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Text('Pateint UI'),
        ),
        body: Stack(
          children: [
            Form(
              key: _formKey,
              child: Container(
                padding: EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      Container(
                        // height: 100,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(8.0)),
                        padding: EdgeInsets.all(9.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Personal Details',
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                            Row(
                              children: <Widget>[
                                Flexible(
                                  child: DynamicInput(
                                    controller: fnameController,
                                    hint: 'First name',
                                    label: 'First Name',
                                    hasborder: true,
                                    multiline: false,
                                    height: 50,
                                    type: DataType.NAME,
                                  ),
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Flexible(
                                  child: DynamicInput(
                                    controller: lnameController,
                                    hint: 'Last name',
                                    label: 'Last Name',
                                    hasborder: true,
                                    multiline: false,
                                    height: 50,
                                    type: DataType.NAME,
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: Row(
                                children: <Widget>[
                                  Flexible(
                                    child: DynamicInput(
                                      controller: genderController,
                                      hint: 'Gender',
                                      label: 'Choose Gender',
                                      hasborder: true,
                                      multiline: false,
                                      height: 50,
                                      type: DataType.NAME,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
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
                            ),
                            Row(
                              // crossAxisAlignment: CrossAxisAlignment.baseline,
                              children: <Widget>[
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Text('Blood Group'),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        DropdownButton<String>(
                                          items: bloodgroups
                                              .map(
                                                (str) =>
                                                    DropdownMenuItem<String>(
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
                                          hint: bloodGroupController.text ==
                                                  null
                                              ? Text('Choose tribe')
                                              : Text(
                                                  '${bloodGroupController.text}'),
                                          // value: tribeController.text == null ? 'Choose Tribe' : tribeController.text,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text('Profession'),
                                      ProfessionPicker(
                                        controller: professionController,
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      //Choose Location Screen
                      Container(
                        padding: EdgeInsets.all(9),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text('Choose Your Location'),
                            NiceButton(
                              title: 'Locate your current location',
                              todo: () async {
                                print(widget.ward);
                                var loc = await Geolocation().getLocation();
                                print(loc);
                                setState(() {
                                  location = loc;
                                });
                                // String locText = await sender.getLocationAsString();
                              },
                            ),
                            LocChooser(
                              wards: widget.wards,
                              ward: widget.ward,
                              callback: (ward){
                                widget.ward = ward;
                                print(ward);
                                wardInfo = WardInfo()..wardname=ward.ward
                                                     ..constituency=ward.constituency
                                                     ..county=ward.county;
                              },
                            ),
                            RichText(
                              text: TextSpan(
                                  text: 'Location\t',
                                  style: TextStyle(color: Colors.black),
                                  children: [
                                    TextSpan(
                                      text:
                                          '\t${location.latitude.toStringAsFixed(5) ?? ""},${location.longitude.toStringAsFixed(5) ?? ""}',
                                    )
                                  ]),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      //Choose Cancer Details
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(8.0)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text('Enter cancer details'),
                              Row(
                                children: <Widget>[
                                  Flexible(
                                    child: CancerNamePicker(
                                      controller: cancerNameController,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 30,
                                  ),
                                  Flexible(
                                    child: TextFormField(
                                      controller: cancerTumorController,
                                      decoration: InputDecoration(
                                          hintText:
                                              'Where did the cancer start',
                                          labelText: 'Origin of cancer'),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                children: <Widget>[
                                  Flexible(
                                    flex: 2,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8.0),
                                      child: Column(
                                        children: <Widget>[
                                          Text('Cancer Stage'),
                                          DropdownButton<int>(
                                            items:
                                                List.generate(5, (i) => i + 1)
                                                    .map(
                                                      (stage) =>
                                                          DropdownMenuItem<int>(
                                                        child: Text('$stage'),
                                                        value: stage,
                                                      ),
                                                    )
                                                    .toList(),
                                            onChanged: (stage) {
                                              setState(() {
                                                cancerStage = stage;
                                              });
                                            },
                                            hint: currentCancerStage.text ==
                                                    null
                                                ? Text('Choose tribe')
                                                : Text(
                                                    '${currentCancerStage.text}'),
                                            // value: tribeController.text == null ? 'Choose Tribe' : tribeController.text,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Spacer(),
                                  Flexible(
                                    flex: 2,
                                    child: Padding(
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
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              child: Container(
                child: isSubmitting
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : null,
              ),
            )
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: NiceButton(
              title: 'Submit Information',
              todo: () async {

                if (_formKey.currentState.validate()) {

                  var rpclocation = Location()
                    ..lat = location.latitude
                    ..lon = location.longitude;
                  
                  var patient = prefix0.Person()
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
                  var cancer = prefix0.Cancer()
                    ..cancertype = cancerNameController.text
                    ..originorgan = cancerTumorController.text
                    ..stage = cancerStage
                    ..origindate = originDateController.text;

                  var patientData = PatientData()
                    ..person = patient
                    ..cancer = cancer;

                  print(patientData);

                  if (widget.connect.canConnect) {
                    setState(() {
                      isSubmitting = true;
                    });

                    prefs.setString('userID', patient.patientID);

                    var resp =
                        await widget.connect.sendPatientData(patientData);
                    print(resp);
                    if (resp.status == Status.OK) {
                      Toast.show(
                          'Patient Records Inserted successfully', context);
                    } else {

                      Toast.show('Conflict in primary key', context);
                      patientData.person.patientID = Uuid().v4();
                      resp = await widget.connect.sendPatientData(patientData);

                      if(resp.status==Status.OK) {
                        Toast.show('Patient record successfully saved', context);
                        Navigator.pop(context);
                      } else {
                        Toast.show('Some other error happened', context);
                      }
                    }
                    setState(() {
                      isSubmitting = false;
                    });

                    var user = prefs.getString('userID');
                    print(user);

                    // var test = prefix0.Cancer()..mergeFromJson(user);                    

                  } else {
                    Toast.show(
                        'The database is not open. Please try again later',
                        context);
                  }
                }
              },
              height: 40,
            ),
          ),
        ));
  }
}


List<String> races = ["Black", "White", "Indian", "Asian", "Australian"];

enum Professions {
  Physician,
  Teacher,
  Accountant,
  Engineer,
  Lawyer,
  Technician,
  Pharmacist,
  Veterinarian,
  Surveyor,
  Architect,
  Secretary,
  Dietitian,
  Electrician,
  Police,
  Chef,
  Physiotherapist,
  Hairdresser,
  Plumber,
  Judge,
  Scientist,
  Firefighter,
  Midwife,
  Surgeon,
  Mechanic,
  Waiter,
  Pilot,
  Laborer,
  Butcher,
  Librarian,
  Designer,
  Barber,
  SoftwareDeveloper,
  MedicalScientist,
  Agriculturist,
  Psychologist,
  Dentist,
  Journalist,
  Tradesman,
  Tailor,
  Cleaner,
  Bartender,
  Cashier,
  Radiographer,
  Broker,
  Therapist,
  Actuary,
  Optician,
  FlightAttendat
}

List<String> bloodgroups = ['A', 'AB', 'B', 'O'];

