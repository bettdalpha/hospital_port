
import 'package:flutter/material.dart';
import 'package:hospital_app/protos/generated/cancers.pbgrpc.dart';

class AccountManager with ChangeNotifier {
  PatientData activeUser;

  AccountManager() {

  }

  Future<bool> getActiveUser() {
    
  }
}