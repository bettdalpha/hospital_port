import 'package:hospital_app/screens/hospital-reg.dart';
import 'package:hospital_app/screens/widgets/nice-button.dart';
import 'package:flutter/material.dart';
import 'package:hospital_app/main.dart';

class ChooseUser extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cancer reporting app'),
        centerTitle: true,
      ),
      body: Stack(
        children: <Widget>[
          SizedBox(
            child: Image.asset('assets/cancer-bg.jpg'),
            height: MediaQuery.of(context).size.height,
          ),
          Positioned(
            child: Container(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    SizedBox(
                      height: 20,
                    ),
                    NiceButton(
                      title: 'Register Hospital',
                      todo: () async {
                        if (connect.canConnect) {
                          print('Database can receive connections');
                        } else {
                          print('Database is offline');
                        }
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RegisterHospital(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
