///
//  Generated code. Do not modify.
//  source: cancers.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:core' as $core show bool, Deprecated, double, int, List, Map, override, pragma, String;

import 'package:protobuf/protobuf.dart' as $pb;

import 'cancers.pbenum.dart';

export 'cancers.pbenum.dart';

class Mess extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Mess')
    ..aOS(1, 'mess')
    ..hasRequiredFields = false
  ;

  Mess._() : super();
  factory Mess() => create();
  factory Mess.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Mess.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  Mess clone() => Mess()..mergeFromMessage(this);
  Mess copyWith(void Function(Mess) updates) => super.copyWith((message) => updates(message as Mess));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Mess create() => Mess._();
  Mess createEmptyInstance() => create();
  static $pb.PbList<Mess> createRepeated() => $pb.PbList<Mess>();
  static Mess getDefault() => _defaultInstance ??= create()..freeze();
  static Mess _defaultInstance;

  $core.String get mess => $_getS(0, '');
  set mess($core.String v) { $_setString(0, v); }
  $core.bool hasMess() => $_has(0);
  void clearMess() => clearField(1);
}

class PatientData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('PatientData')
    ..a<Person>(1, 'person', $pb.PbFieldType.OM, Person.getDefault, Person.create)
    ..a<Cancer>(2, 'cancer', $pb.PbFieldType.OM, Cancer.getDefault, Cancer.create)
    ..hasRequiredFields = false
  ;

  PatientData._() : super();
  factory PatientData() => create();
  factory PatientData.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PatientData.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  PatientData clone() => PatientData()..mergeFromMessage(this);
  PatientData copyWith(void Function(PatientData) updates) => super.copyWith((message) => updates(message as PatientData));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PatientData create() => PatientData._();
  PatientData createEmptyInstance() => create();
  static $pb.PbList<PatientData> createRepeated() => $pb.PbList<PatientData>();
  static PatientData getDefault() => _defaultInstance ??= create()..freeze();
  static PatientData _defaultInstance;

  Person get person => $_getN(0);
  set person(Person v) { setField(1, v); }
  $core.bool hasPerson() => $_has(0);
  void clearPerson() => clearField(1);

  Cancer get cancer => $_getN(1);
  set cancer(Cancer v) { setField(2, v); }
  $core.bool hasCancer() => $_has(1);
  void clearCancer() => clearField(2);
}

class TreatmentDetails extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('TreatmentDetails')
    ..aOS(1, 'treatment')
    ..aOS(2, 'patientID')
    ..aOS(3, 'hospitalID')
    ..a<$core.int>(4, 'cost', $pb.PbFieldType.O3)
    ..aOS(5, 'date')
    ..hasRequiredFields = false
  ;

  TreatmentDetails._() : super();
  factory TreatmentDetails() => create();
  factory TreatmentDetails.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TreatmentDetails.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  TreatmentDetails clone() => TreatmentDetails()..mergeFromMessage(this);
  TreatmentDetails copyWith(void Function(TreatmentDetails) updates) => super.copyWith((message) => updates(message as TreatmentDetails));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TreatmentDetails create() => TreatmentDetails._();
  TreatmentDetails createEmptyInstance() => create();
  static $pb.PbList<TreatmentDetails> createRepeated() => $pb.PbList<TreatmentDetails>();
  static TreatmentDetails getDefault() => _defaultInstance ??= create()..freeze();
  static TreatmentDetails _defaultInstance;

  $core.String get treatment => $_getS(0, '');
  set treatment($core.String v) { $_setString(0, v); }
  $core.bool hasTreatment() => $_has(0);
  void clearTreatment() => clearField(1);

  $core.String get patientID => $_getS(1, '');
  set patientID($core.String v) { $_setString(1, v); }
  $core.bool hasPatientID() => $_has(1);
  void clearPatientID() => clearField(2);

  $core.String get hospitalID => $_getS(2, '');
  set hospitalID($core.String v) { $_setString(2, v); }
  $core.bool hasHospitalID() => $_has(2);
  void clearHospitalID() => clearField(3);

  $core.int get cost => $_get(3, 0);
  set cost($core.int v) { $_setSignedInt32(3, v); }
  $core.bool hasCost() => $_has(3);
  void clearCost() => clearField(4);

  $core.String get date => $_getS(4, '');
  set date($core.String v) { $_setString(4, v); }
  $core.bool hasDate() => $_has(4);
  void clearDate() => clearField(5);
}

class Person extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Person')
    ..aOS(1, 'firstname')
    ..aOS(2, 'lastname')
    ..aOS(3, 'gender')
    ..aOS(4, 'profession')
    ..aOS(5, 'birthplace')
    ..a<$core.int>(6, 'age', $pb.PbFieldType.O3)
    ..aOS(7, 'bloodgroup')
    ..a<Location>(8, 'location', $pb.PbFieldType.OM, Location.getDefault, Location.create)
    ..a<WardInfo>(9, 'wardname', $pb.PbFieldType.OM, WardInfo.getDefault, WardInfo.create)
    ..aOS(10, 'patientID')
    ..hasRequiredFields = false
  ;

  Person._() : super();
  factory Person() => create();
  factory Person.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Person.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  Person clone() => Person()..mergeFromMessage(this);
  Person copyWith(void Function(Person) updates) => super.copyWith((message) => updates(message as Person));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Person create() => Person._();
  Person createEmptyInstance() => create();
  static $pb.PbList<Person> createRepeated() => $pb.PbList<Person>();
  static Person getDefault() => _defaultInstance ??= create()..freeze();
  static Person _defaultInstance;

  $core.String get firstname => $_getS(0, '');
  set firstname($core.String v) { $_setString(0, v); }
  $core.bool hasFirstname() => $_has(0);
  void clearFirstname() => clearField(1);

  $core.String get lastname => $_getS(1, '');
  set lastname($core.String v) { $_setString(1, v); }
  $core.bool hasLastname() => $_has(1);
  void clearLastname() => clearField(2);

  $core.String get gender => $_getS(2, '');
  set gender($core.String v) { $_setString(2, v); }
  $core.bool hasGender() => $_has(2);
  void clearGender() => clearField(3);

  $core.String get profession => $_getS(3, '');
  set profession($core.String v) { $_setString(3, v); }
  $core.bool hasProfession() => $_has(3);
  void clearProfession() => clearField(4);

  $core.String get birthplace => $_getS(4, '');
  set birthplace($core.String v) { $_setString(4, v); }
  $core.bool hasBirthplace() => $_has(4);
  void clearBirthplace() => clearField(5);

  $core.int get age => $_get(5, 0);
  set age($core.int v) { $_setSignedInt32(5, v); }
  $core.bool hasAge() => $_has(5);
  void clearAge() => clearField(6);

  $core.String get bloodgroup => $_getS(6, '');
  set bloodgroup($core.String v) { $_setString(6, v); }
  $core.bool hasBloodgroup() => $_has(6);
  void clearBloodgroup() => clearField(7);

  Location get location => $_getN(7);
  set location(Location v) { setField(8, v); }
  $core.bool hasLocation() => $_has(7);
  void clearLocation() => clearField(8);

  WardInfo get wardname => $_getN(8);
  set wardname(WardInfo v) { setField(9, v); }
  $core.bool hasWardname() => $_has(8);
  void clearWardname() => clearField(9);

  $core.String get patientID => $_getS(9, '');
  set patientID($core.String v) { $_setString(9, v); }
  $core.bool hasPatientID() => $_has(9);
  void clearPatientID() => clearField(10);
}

class HospitalData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('HospitalData')
    ..aOS(1, 'hospitalname')
    ..aOS(2, 'email')
    ..a<Location>(3, 'location', $pb.PbFieldType.OM, Location.getDefault, Location.create)
    ..pPS(4, 'specialization')
    ..aOS(5, 'guid')
    ..a<WardInfo>(6, 'info', $pb.PbFieldType.OM, WardInfo.getDefault, WardInfo.create)
    ..aOS(7, 'password')
    ..hasRequiredFields = false
  ;

  HospitalData._() : super();
  factory HospitalData() => create();
  factory HospitalData.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory HospitalData.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  HospitalData clone() => HospitalData()..mergeFromMessage(this);
  HospitalData copyWith(void Function(HospitalData) updates) => super.copyWith((message) => updates(message as HospitalData));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static HospitalData create() => HospitalData._();
  HospitalData createEmptyInstance() => create();
  static $pb.PbList<HospitalData> createRepeated() => $pb.PbList<HospitalData>();
  static HospitalData getDefault() => _defaultInstance ??= create()..freeze();
  static HospitalData _defaultInstance;

  $core.String get hospitalname => $_getS(0, '');
  set hospitalname($core.String v) { $_setString(0, v); }
  $core.bool hasHospitalname() => $_has(0);
  void clearHospitalname() => clearField(1);

  $core.String get email => $_getS(1, '');
  set email($core.String v) { $_setString(1, v); }
  $core.bool hasEmail() => $_has(1);
  void clearEmail() => clearField(2);

  Location get location => $_getN(2);
  set location(Location v) { setField(3, v); }
  $core.bool hasLocation() => $_has(2);
  void clearLocation() => clearField(3);

  $core.List<$core.String> get specialization => $_getList(3);

  $core.String get guid => $_getS(4, '');
  set guid($core.String v) { $_setString(4, v); }
  $core.bool hasGuid() => $_has(4);
  void clearGuid() => clearField(5);

  WardInfo get info => $_getN(5);
  set info(WardInfo v) { setField(6, v); }
  $core.bool hasInfo() => $_has(5);
  void clearInfo() => clearField(6);

  $core.String get password => $_getS(6, '');
  set password($core.String v) { $_setString(6, v); }
  $core.bool hasPassword() => $_has(6);
  void clearPassword() => clearField(7);
}

class HospitalReport extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('HospitalReport')
    ..aOS(1, 'name')
    ..a<$core.int>(2, 'count', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  HospitalReport._() : super();
  factory HospitalReport() => create();
  factory HospitalReport.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory HospitalReport.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  HospitalReport clone() => HospitalReport()..mergeFromMessage(this);
  HospitalReport copyWith(void Function(HospitalReport) updates) => super.copyWith((message) => updates(message as HospitalReport));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static HospitalReport create() => HospitalReport._();
  HospitalReport createEmptyInstance() => create();
  static $pb.PbList<HospitalReport> createRepeated() => $pb.PbList<HospitalReport>();
  static HospitalReport getDefault() => _defaultInstance ??= create()..freeze();
  static HospitalReport _defaultInstance;

  $core.String get name => $_getS(0, '');
  set name($core.String v) { $_setString(0, v); }
  $core.bool hasName() => $_has(0);
  void clearName() => clearField(1);

  $core.int get count => $_get(1, 0);
  set count($core.int v) { $_setSignedInt32(1, v); }
  $core.bool hasCount() => $_has(1);
  void clearCount() => clearField(2);
}

class FullHospitalReport extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('FullHospitalReport')
    ..pc<HospitalReport>(1, 'reports', $pb.PbFieldType.PM,HospitalReport.create)
    ..hasRequiredFields = false
  ;

  FullHospitalReport._() : super();
  factory FullHospitalReport() => create();
  factory FullHospitalReport.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FullHospitalReport.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  FullHospitalReport clone() => FullHospitalReport()..mergeFromMessage(this);
  FullHospitalReport copyWith(void Function(FullHospitalReport) updates) => super.copyWith((message) => updates(message as FullHospitalReport));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static FullHospitalReport create() => FullHospitalReport._();
  FullHospitalReport createEmptyInstance() => create();
  static $pb.PbList<FullHospitalReport> createRepeated() => $pb.PbList<FullHospitalReport>();
  static FullHospitalReport getDefault() => _defaultInstance ??= create()..freeze();
  static FullHospitalReport _defaultInstance;

  $core.List<HospitalReport> get reports => $_getList(0);
}

class Auth extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Auth')
    ..aOS(1, 'uuid')
    ..aOS(2, 'password')
    ..hasRequiredFields = false
  ;

  Auth._() : super();
  factory Auth() => create();
  factory Auth.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Auth.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  Auth clone() => Auth()..mergeFromMessage(this);
  Auth copyWith(void Function(Auth) updates) => super.copyWith((message) => updates(message as Auth));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Auth create() => Auth._();
  Auth createEmptyInstance() => create();
  static $pb.PbList<Auth> createRepeated() => $pb.PbList<Auth>();
  static Auth getDefault() => _defaultInstance ??= create()..freeze();
  static Auth _defaultInstance;

  $core.String get uuid => $_getS(0, '');
  set uuid($core.String v) { $_setString(0, v); }
  $core.bool hasUuid() => $_has(0);
  void clearUuid() => clearField(1);

  $core.String get password => $_getS(1, '');
  set password($core.String v) { $_setString(1, v); }
  $core.bool hasPassword() => $_has(1);
  void clearPassword() => clearField(2);
}

class NewTreatment extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('NewTreatment')
    ..aOS(1, 'hospitalID')
    ..aOS(2, 'specialization')
    ..hasRequiredFields = false
  ;

  NewTreatment._() : super();
  factory NewTreatment() => create();
  factory NewTreatment.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory NewTreatment.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  NewTreatment clone() => NewTreatment()..mergeFromMessage(this);
  NewTreatment copyWith(void Function(NewTreatment) updates) => super.copyWith((message) => updates(message as NewTreatment));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static NewTreatment create() => NewTreatment._();
  NewTreatment createEmptyInstance() => create();
  static $pb.PbList<NewTreatment> createRepeated() => $pb.PbList<NewTreatment>();
  static NewTreatment getDefault() => _defaultInstance ??= create()..freeze();
  static NewTreatment _defaultInstance;

  $core.String get hospitalID => $_getS(0, '');
  set hospitalID($core.String v) { $_setString(0, v); }
  $core.bool hasHospitalID() => $_has(0);
  void clearHospitalID() => clearField(1);

  $core.String get specialization => $_getS(1, '');
  set specialization($core.String v) { $_setString(1, v); }
  $core.bool hasSpecialization() => $_has(1);
  void clearSpecialization() => clearField(2);
}

class Cancer extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Cancer')
    ..aOS(1, 'cancertype')
    ..aOS(2, 'originorgan')
    ..a<$core.int>(3, 'stage', $pb.PbFieldType.O3)
    ..aOS(4, 'origindate')
    ..hasRequiredFields = false
  ;

  Cancer._() : super();
  factory Cancer() => create();
  factory Cancer.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Cancer.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  Cancer clone() => Cancer()..mergeFromMessage(this);
  Cancer copyWith(void Function(Cancer) updates) => super.copyWith((message) => updates(message as Cancer));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Cancer create() => Cancer._();
  Cancer createEmptyInstance() => create();
  static $pb.PbList<Cancer> createRepeated() => $pb.PbList<Cancer>();
  static Cancer getDefault() => _defaultInstance ??= create()..freeze();
  static Cancer _defaultInstance;

  $core.String get cancertype => $_getS(0, '');
  set cancertype($core.String v) { $_setString(0, v); }
  $core.bool hasCancertype() => $_has(0);
  void clearCancertype() => clearField(1);

  $core.String get originorgan => $_getS(1, '');
  set originorgan($core.String v) { $_setString(1, v); }
  $core.bool hasOriginorgan() => $_has(1);
  void clearOriginorgan() => clearField(2);

  $core.int get stage => $_get(2, 0);
  set stage($core.int v) { $_setSignedInt32(2, v); }
  $core.bool hasStage() => $_has(2);
  void clearStage() => clearField(3);

  $core.String get origindate => $_getS(3, '');
  set origindate($core.String v) { $_setString(3, v); }
  $core.bool hasOrigindate() => $_has(3);
  void clearOrigindate() => clearField(4);
}

class InsertResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('InsertResponse')
    ..aOS(1, 'response')
    ..e<Status>(2, 'status', $pb.PbFieldType.OE, Status.OK, Status.valueOf, Status.values)
    ..hasRequiredFields = false
  ;

  InsertResponse._() : super();
  factory InsertResponse() => create();
  factory InsertResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory InsertResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  InsertResponse clone() => InsertResponse()..mergeFromMessage(this);
  InsertResponse copyWith(void Function(InsertResponse) updates) => super.copyWith((message) => updates(message as InsertResponse));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static InsertResponse create() => InsertResponse._();
  InsertResponse createEmptyInstance() => create();
  static $pb.PbList<InsertResponse> createRepeated() => $pb.PbList<InsertResponse>();
  static InsertResponse getDefault() => _defaultInstance ??= create()..freeze();
  static InsertResponse _defaultInstance;

  $core.String get response => $_getS(0, '');
  set response($core.String v) { $_setString(0, v); }
  $core.bool hasResponse() => $_has(0);
  void clearResponse() => clearField(1);

  Status get status => $_getN(1);
  set status(Status v) { setField(2, v); }
  $core.bool hasStatus() => $_has(1);
  void clearStatus() => clearField(2);
}

class WardInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('WardInfo')
    ..aOS(1, 'wardname')
    ..aOS(2, 'constituency')
    ..aOS(3, 'county')
    ..hasRequiredFields = false
  ;

  WardInfo._() : super();
  factory WardInfo() => create();
  factory WardInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory WardInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  WardInfo clone() => WardInfo()..mergeFromMessage(this);
  WardInfo copyWith(void Function(WardInfo) updates) => super.copyWith((message) => updates(message as WardInfo));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static WardInfo create() => WardInfo._();
  WardInfo createEmptyInstance() => create();
  static $pb.PbList<WardInfo> createRepeated() => $pb.PbList<WardInfo>();
  static WardInfo getDefault() => _defaultInstance ??= create()..freeze();
  static WardInfo _defaultInstance;

  $core.String get wardname => $_getS(0, '');
  set wardname($core.String v) { $_setString(0, v); }
  $core.bool hasWardname() => $_has(0);
  void clearWardname() => clearField(1);

  $core.String get constituency => $_getS(1, '');
  set constituency($core.String v) { $_setString(1, v); }
  $core.bool hasConstituency() => $_has(1);
  void clearConstituency() => clearField(2);

  $core.String get county => $_getS(2, '');
  set county($core.String v) { $_setString(2, v); }
  $core.bool hasCounty() => $_has(2);
  void clearCounty() => clearField(3);
}

class Location extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Location')
    ..a<$core.double>(1, 'lat', $pb.PbFieldType.OD)
    ..a<$core.double>(2, 'lon', $pb.PbFieldType.OD)
    ..hasRequiredFields = false
  ;

  Location._() : super();
  factory Location() => create();
  factory Location.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Location.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  Location clone() => Location()..mergeFromMessage(this);
  Location copyWith(void Function(Location) updates) => super.copyWith((message) => updates(message as Location));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Location create() => Location._();
  Location createEmptyInstance() => create();
  static $pb.PbList<Location> createRepeated() => $pb.PbList<Location>();
  static Location getDefault() => _defaultInstance ??= create()..freeze();
  static Location _defaultInstance;

  $core.double get lat => $_getN(0);
  set lat($core.double v) { $_setDouble(0, v); }
  $core.bool hasLat() => $_has(0);
  void clearLat() => clearField(1);

  $core.double get lon => $_getN(1);
  set lon($core.double v) { $_setDouble(1, v); }
  $core.bool hasLon() => $_has(1);
  void clearLon() => clearField(2);
}

class Hospital extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Hospital')
    ..aOS(1, 'name')
    ..aOS(2, 'guid')
    ..a<WardInfo>(3, 'wardinfo', $pb.PbFieldType.OM, WardInfo.getDefault, WardInfo.create)
    ..a<Location>(4, 'location', $pb.PbFieldType.OM, Location.getDefault, Location.create)
    ..pPS(5, 'specialization')
    ..hasRequiredFields = false
  ;

  Hospital._() : super();
  factory Hospital() => create();
  factory Hospital.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Hospital.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  Hospital clone() => Hospital()..mergeFromMessage(this);
  Hospital copyWith(void Function(Hospital) updates) => super.copyWith((message) => updates(message as Hospital));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Hospital create() => Hospital._();
  Hospital createEmptyInstance() => create();
  static $pb.PbList<Hospital> createRepeated() => $pb.PbList<Hospital>();
  static Hospital getDefault() => _defaultInstance ??= create()..freeze();
  static Hospital _defaultInstance;

  $core.String get name => $_getS(0, '');
  set name($core.String v) { $_setString(0, v); }
  $core.bool hasName() => $_has(0);
  void clearName() => clearField(1);

  $core.String get guid => $_getS(1, '');
  set guid($core.String v) { $_setString(1, v); }
  $core.bool hasGuid() => $_has(1);
  void clearGuid() => clearField(2);

  WardInfo get wardinfo => $_getN(2);
  set wardinfo(WardInfo v) { setField(3, v); }
  $core.bool hasWardinfo() => $_has(2);
  void clearWardinfo() => clearField(3);

  Location get location => $_getN(3);
  set location(Location v) { setField(4, v); }
  $core.bool hasLocation() => $_has(3);
  void clearLocation() => clearField(4);

  $core.List<$core.String> get specialization => $_getList(4);
}

class Hospitals extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Hospitals')
    ..pc<Hospital>(1, 'hospitals', $pb.PbFieldType.PM,Hospital.create)
    ..hasRequiredFields = false
  ;

  Hospitals._() : super();
  factory Hospitals() => create();
  factory Hospitals.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Hospitals.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  Hospitals clone() => Hospitals()..mergeFromMessage(this);
  Hospitals copyWith(void Function(Hospitals) updates) => super.copyWith((message) => updates(message as Hospitals));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Hospitals create() => Hospitals._();
  Hospitals createEmptyInstance() => create();
  static $pb.PbList<Hospitals> createRepeated() => $pb.PbList<Hospitals>();
  static Hospitals getDefault() => _defaultInstance ??= create()..freeze();
  static Hospitals _defaultInstance;

  $core.List<Hospital> get hospitals => $_getList(0);
}

