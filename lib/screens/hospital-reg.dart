import 'package:flutter/material.dart';
import 'package:hospital_app/protos/generated/cancers.pb.dart';
import 'package:hospital_app/screens/home-page.dart';
import 'package:hospital_app/screens/hospital-dash.dart';
import 'package:hospital_app/screens/location-widget.dart';
import 'package:hospital_app/screens/widgets/cancer-namepicker.dart';
import 'package:hospital_app/screens/widgets/nice-button.dart';
import 'package:hospital_app/utils/geolocation.dart';
import 'package:hospital_app/utils/reusable.dart';
import 'package:hospital_app/utils/wards-reader.dart';
import 'package:latlong/latlong.dart';
import 'package:toast/toast.dart';
import 'package:uuid/uuid.dart';

import '../main.dart';

class RegisterHospital extends StatefulWidget {
  @override
  _RegisterHospitalState createState() => _RegisterHospitalState();
}

class _RegisterHospitalState extends State<RegisterHospital> {
  LatLng location;
  Ward ward;
  var cancerNameCtrl = TextEditingController();
  var hospNameCtrl = TextEditingController();
  bool isRegistering =false;

  Set<String> specaility = Set();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hospital Registration'),
        actions: <Widget>[
          RaisedButton.icon(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {
              prefs.remove('activeHospital');
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => ChooseUser()));
            },
            color: Color(0xFF801E48),
            label: Text('Logout'),
          )
        ],
      ),
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 20),
                  Text('Hospital Name'),
                  DynamicInput(
                    controller: hospNameCtrl,
                    hint: 'Name of hospital',
                    label: 'Name of hospital',
                    hasborder: true,
                    type: DataType.TEXT,
                  ),
                  SizedBox(height: 20),
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
                  ),
                  SizedBox(height: 20),
                  Text('Your administrative regions'),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: LocChooser(
                      callback: (ward) {
                        setState(() {
                          this.ward = ward;
                        });
                      },
                      ward: ward,
                      wards: wards,
                    ),
                  ),
                  Text('Cancers you can treat'),
                  CancerNamePicker(
                    controller: cancerNameCtrl,
                    onSelected: (val) {
                      setState(() {
                        specaility.add(val);
                        cancerNameCtrl.text = '';
                      });
                    },
                    clearOnPick: true,
                  ),
                  Wrap(
                    children: <Widget>[] +
                        specaility
                            .map(
                              (str) => Chip(
                                label: Text(str),
                                deleteIcon: Icon(Icons.delete_forever),
                                onDeleted: () {
                                  setState(() {
                                    specaility.remove(str);
                                  });
                                },
                              ),
                            )
                            .toList(),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height*0.4,
            left: MediaQuery.of(context).size.width*0.4,
            child: Container(
              child: isRegistering ? Center(child: CircularProgressIndicator(),) : Container(),
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: NiceButton(
            title: 'Register and Log in',
            todo: () async {
              var wardinfo = WardInfo()
                ..wardname = ward.ward
                ..county = ward.county
                ..constituency = ward.constituency;
              var loc = Location()
                ..lat = location.latitude
                ..lon = location.longitude;
              var hospitalData = HospitalData()
                ..hospitalname = hospNameCtrl.text
                ..specialization.addAll(specaility)
                ..info = wardinfo
                ..guid = Uuid().v4()
                ..location = loc
                ..password = 'SSAFASDfasdfasdf';
              setState(() {
               isRegistering=true; 
              });
              var res =
                  await connect.senderClient.registerHospital(hospitalData);
              
              if (res.status == Status.OK) {
                setState(() {
                 isRegistering = false; 
                });
                print('Successfully registered the hospital');
                prefs.setString('activeHospital', hospitalData.writeToJson());
                Navigator.pop(context);

                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => HospitalDash(
                            hospitalData: hospitalData,
                          )),
                );
              } else {
                setState(() {
                 isRegistering = false; 
                });
                Toast.show(res.response, context);
              }
            },
            // height: ,
          ),
        ),
      ),
    );
  }
}
