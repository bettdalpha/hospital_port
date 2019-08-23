///
//  Generated code. Do not modify.
//  source: cancers.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:async' as $async;

import 'dart:core' as $core show int, String, List;

import 'package:grpc/service_api.dart' as $grpc;
import 'cancers.pb.dart' as $0;
export 'cancers.pb.dart';

class SenderClient extends $grpc.Client {
  static final _$sendPatientData =
      $grpc.ClientMethod<$0.PatientData, $0.InsertResponse>(
          '/Sender/SendPatientData',
          ($0.PatientData value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.InsertResponse.fromBuffer(value));
  static final _$sendMessage = $grpc.ClientMethod<$0.Mess, $0.InsertResponse>(
      '/Sender/SendMessage',
      ($0.Mess value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.InsertResponse.fromBuffer(value));
  static final _$getWard = $grpc.ClientMethod<$0.Location, $0.WardInfo>(
      '/Sender/GetWard',
      ($0.Location value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.WardInfo.fromBuffer(value));
  static final _$getHospitals = $grpc.ClientMethod<$0.Mess, $0.Hospitals>(
      '/Sender/GetHospitals',
      ($0.Mess value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Hospitals.fromBuffer(value));
  static final _$registerHospital =
      $grpc.ClientMethod<$0.HospitalData, $0.InsertResponse>(
          '/Sender/RegisterHospital',
          ($0.HospitalData value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.InsertResponse.fromBuffer(value));
  static final _$addTreatment =
      $grpc.ClientMethod<$0.TreatmentDetails, $0.InsertResponse>(
          '/Sender/AddTreatment',
          ($0.TreatmentDetails value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.InsertResponse.fromBuffer(value));
  static final _$addHospitalSpecialization =
      $grpc.ClientMethod<$0.NewTreatment, $0.InsertResponse>(
          '/Sender/AddHospitalSpecialization',
          ($0.NewTreatment value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.InsertResponse.fromBuffer(value));
  static final _$authenticateHospital =
      $grpc.ClientMethod<$0.Auth, $0.Hospital>(
          '/Sender/AuthenticateHospital',
          ($0.Auth value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.Hospital.fromBuffer(value));
  static final _$authenticateUser = $grpc.ClientMethod<$0.Auth, $0.PatientData>(
      '/Sender/AuthenticateUser',
      ($0.Auth value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.PatientData.fromBuffer(value));
  static final _$getHospitalReport =
      $grpc.ClientMethod<$0.Mess, $0.FullHospitalReport>(
          '/Sender/GetHospitalReport',
          ($0.Mess value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.FullHospitalReport.fromBuffer(value));

  SenderClient($grpc.ClientChannel channel, {$grpc.CallOptions options})
      : super(channel, options: options);

  $grpc.ResponseFuture<$0.InsertResponse> sendPatientData(
      $0.PatientData request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$sendPatientData, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.InsertResponse> sendMessage($0.Mess request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$sendMessage, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.WardInfo> getWard($0.Location request,
      {$grpc.CallOptions options}) {
    final call = $createCall(_$getWard, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.Hospitals> getHospitals($0.Mess request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$getHospitals, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.InsertResponse> registerHospital(
      $0.HospitalData request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$registerHospital, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.InsertResponse> addTreatment(
      $0.TreatmentDetails request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$addTreatment, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.InsertResponse> addHospitalSpecialization(
      $0.NewTreatment request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$addHospitalSpecialization, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.Hospital> authenticateHospital($0.Auth request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$authenticateHospital, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.PatientData> authenticateUser($0.Auth request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$authenticateUser, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.FullHospitalReport> getHospitalReport($0.Mess request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$getHospitalReport, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }
}

abstract class SenderServiceBase extends $grpc.Service {
  $core.String get $name => 'Sender';

  SenderServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.PatientData, $0.InsertResponse>(
        'SendPatientData',
        sendPatientData_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.PatientData.fromBuffer(value),
        ($0.InsertResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Mess, $0.InsertResponse>(
        'SendMessage',
        sendMessage_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Mess.fromBuffer(value),
        ($0.InsertResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Location, $0.WardInfo>(
        'GetWard',
        getWard_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Location.fromBuffer(value),
        ($0.WardInfo value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Mess, $0.Hospitals>(
        'GetHospitals',
        getHospitals_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Mess.fromBuffer(value),
        ($0.Hospitals value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.HospitalData, $0.InsertResponse>(
        'RegisterHospital',
        registerHospital_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.HospitalData.fromBuffer(value),
        ($0.InsertResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.TreatmentDetails, $0.InsertResponse>(
        'AddTreatment',
        addTreatment_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.TreatmentDetails.fromBuffer(value),
        ($0.InsertResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.NewTreatment, $0.InsertResponse>(
        'AddHospitalSpecialization',
        addHospitalSpecialization_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.NewTreatment.fromBuffer(value),
        ($0.InsertResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Auth, $0.Hospital>(
        'AuthenticateHospital',
        authenticateHospital_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Auth.fromBuffer(value),
        ($0.Hospital value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Auth, $0.PatientData>(
        'AuthenticateUser',
        authenticateUser_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Auth.fromBuffer(value),
        ($0.PatientData value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Mess, $0.FullHospitalReport>(
        'GetHospitalReport',
        getHospitalReport_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Mess.fromBuffer(value),
        ($0.FullHospitalReport value) => value.writeToBuffer()));
  }

  $async.Future<$0.InsertResponse> sendPatientData_Pre(
      $grpc.ServiceCall call, $async.Future<$0.PatientData> request) async {
    return sendPatientData(call, await request);
  }

  $async.Future<$0.InsertResponse> sendMessage_Pre(
      $grpc.ServiceCall call, $async.Future<$0.Mess> request) async {
    return sendMessage(call, await request);
  }

  $async.Future<$0.WardInfo> getWard_Pre(
      $grpc.ServiceCall call, $async.Future<$0.Location> request) async {
    return getWard(call, await request);
  }

  $async.Future<$0.Hospitals> getHospitals_Pre(
      $grpc.ServiceCall call, $async.Future<$0.Mess> request) async {
    return getHospitals(call, await request);
  }

  $async.Future<$0.InsertResponse> registerHospital_Pre(
      $grpc.ServiceCall call, $async.Future<$0.HospitalData> request) async {
    return registerHospital(call, await request);
  }

  $async.Future<$0.InsertResponse> addTreatment_Pre($grpc.ServiceCall call,
      $async.Future<$0.TreatmentDetails> request) async {
    return addTreatment(call, await request);
  }

  $async.Future<$0.InsertResponse> addHospitalSpecialization_Pre(
      $grpc.ServiceCall call, $async.Future<$0.NewTreatment> request) async {
    return addHospitalSpecialization(call, await request);
  }

  $async.Future<$0.Hospital> authenticateHospital_Pre(
      $grpc.ServiceCall call, $async.Future<$0.Auth> request) async {
    return authenticateHospital(call, await request);
  }

  $async.Future<$0.PatientData> authenticateUser_Pre(
      $grpc.ServiceCall call, $async.Future<$0.Auth> request) async {
    return authenticateUser(call, await request);
  }

  $async.Future<$0.FullHospitalReport> getHospitalReport_Pre(
      $grpc.ServiceCall call, $async.Future<$0.Mess> request) async {
    return getHospitalReport(call, await request);
  }

  $async.Future<$0.InsertResponse> sendPatientData(
      $grpc.ServiceCall call, $0.PatientData request);
  $async.Future<$0.InsertResponse> sendMessage(
      $grpc.ServiceCall call, $0.Mess request);
  $async.Future<$0.WardInfo> getWard(
      $grpc.ServiceCall call, $0.Location request);
  $async.Future<$0.Hospitals> getHospitals(
      $grpc.ServiceCall call, $0.Mess request);
  $async.Future<$0.InsertResponse> registerHospital(
      $grpc.ServiceCall call, $0.HospitalData request);
  $async.Future<$0.InsertResponse> addTreatment(
      $grpc.ServiceCall call, $0.TreatmentDetails request);
  $async.Future<$0.InsertResponse> addHospitalSpecialization(
      $grpc.ServiceCall call, $0.NewTreatment request);
  $async.Future<$0.Hospital> authenticateHospital(
      $grpc.ServiceCall call, $0.Auth request);
  $async.Future<$0.PatientData> authenticateUser(
      $grpc.ServiceCall call, $0.Auth request);
  $async.Future<$0.FullHospitalReport> getHospitalReport(
      $grpc.ServiceCall call, $0.Mess request);
}
