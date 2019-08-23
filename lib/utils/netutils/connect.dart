
import 'package:hospital_app/protos/generated/cancers.pbgrpc.dart';
import 'package:flutter/material.dart';
import 'package:grpc/grpc.dart';
import 'dart:async';

class Connect {
  //send patient object, check connection if exists
  SenderClient senderClient;
  ClientChannel channel;
  String host;
  
  bool canConnect = false;

  Connect({@required this.host}) {
    
    channel = ClientChannel(
      host,
      port: 6789,
      options: ChannelOptions(
        credentials: ChannelCredentials.insecure(),
      ),
    );

    senderClient = SenderClient(channel,options: CallOptions(timeout: Duration(minutes: 1)));

    // testConnection().then((onValue){
    //   onValue ? print('Can Connect') : print('Cannot Connect');
    // });

  }

  Future<bool> testConnection() async{
    var con = await channel.getConnection();
    if(con!=null){
      canConnect = true;
      return true;
    } else {
      canConnect = false;
      return false;
    }
  }

  Future<InsertResponse> sendPatientData(PatientData data) async {
    InsertResponse response;
    try {
      response = await senderClient.sendPatientData(data);
    } catch (e) {
      print(e);
      return null;
    }
    return response;
  }
}
