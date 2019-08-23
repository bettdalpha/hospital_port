///
//  Generated code. Do not modify.
//  source: cancers.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

const Status$json = const {
  '1': 'Status',
  '2': const [
    const {'1': 'OK', '2': 0},
    const {'1': 'ERROR', '2': 1},
    const {'1': 'DUPLICATE', '2': 2},
  ],
};

const Mess$json = const {
  '1': 'Mess',
  '2': const [
    const {'1': 'mess', '3': 1, '4': 1, '5': 9, '10': 'mess'},
  ],
};

const PatientData$json = const {
  '1': 'PatientData',
  '2': const [
    const {'1': 'person', '3': 1, '4': 1, '5': 11, '6': '.Person', '10': 'person'},
    const {'1': 'cancer', '3': 2, '4': 1, '5': 11, '6': '.Cancer', '10': 'cancer'},
  ],
};

const TreatmentDetails$json = const {
  '1': 'TreatmentDetails',
  '2': const [
    const {'1': 'treatment', '3': 1, '4': 1, '5': 9, '10': 'treatment'},
    const {'1': 'patientID', '3': 2, '4': 1, '5': 9, '10': 'patientID'},
    const {'1': 'hospitalID', '3': 3, '4': 1, '5': 9, '10': 'hospitalID'},
    const {'1': 'cost', '3': 4, '4': 1, '5': 5, '10': 'cost'},
    const {'1': 'date', '3': 5, '4': 1, '5': 9, '10': 'date'},
  ],
};

const Person$json = const {
  '1': 'Person',
  '2': const [
    const {'1': 'firstname', '3': 1, '4': 1, '5': 9, '10': 'firstname'},
    const {'1': 'lastname', '3': 2, '4': 1, '5': 9, '10': 'lastname'},
    const {'1': 'gender', '3': 3, '4': 1, '5': 9, '10': 'gender'},
    const {'1': 'profession', '3': 4, '4': 1, '5': 9, '10': 'profession'},
    const {'1': 'birthplace', '3': 5, '4': 1, '5': 9, '10': 'birthplace'},
    const {'1': 'age', '3': 6, '4': 1, '5': 5, '10': 'age'},
    const {'1': 'bloodgroup', '3': 7, '4': 1, '5': 9, '10': 'bloodgroup'},
    const {'1': 'location', '3': 8, '4': 1, '5': 11, '6': '.Location', '10': 'location'},
    const {'1': 'wardname', '3': 9, '4': 1, '5': 11, '6': '.WardInfo', '10': 'wardname'},
    const {'1': 'patientID', '3': 10, '4': 1, '5': 9, '10': 'patientID'},
  ],
};

const HospitalData$json = const {
  '1': 'HospitalData',
  '2': const [
    const {'1': 'hospitalname', '3': 1, '4': 1, '5': 9, '10': 'hospitalname'},
    const {'1': 'email', '3': 2, '4': 1, '5': 9, '10': 'email'},
    const {'1': 'location', '3': 3, '4': 1, '5': 11, '6': '.Location', '10': 'location'},
    const {'1': 'specialization', '3': 4, '4': 3, '5': 9, '10': 'specialization'},
    const {'1': 'guid', '3': 5, '4': 1, '5': 9, '10': 'guid'},
    const {'1': 'info', '3': 6, '4': 1, '5': 11, '6': '.WardInfo', '10': 'info'},
    const {'1': 'password', '3': 7, '4': 1, '5': 9, '10': 'password'},
  ],
};

const HospitalReport$json = const {
  '1': 'HospitalReport',
  '2': const [
    const {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'count', '3': 2, '4': 1, '5': 5, '10': 'count'},
  ],
};

const FullHospitalReport$json = const {
  '1': 'FullHospitalReport',
  '2': const [
    const {'1': 'reports', '3': 1, '4': 3, '5': 11, '6': '.HospitalReport', '10': 'reports'},
  ],
};

const Auth$json = const {
  '1': 'Auth',
  '2': const [
    const {'1': 'uuid', '3': 1, '4': 1, '5': 9, '10': 'uuid'},
    const {'1': 'password', '3': 2, '4': 1, '5': 9, '10': 'password'},
  ],
};

const NewTreatment$json = const {
  '1': 'NewTreatment',
  '2': const [
    const {'1': 'hospitalID', '3': 1, '4': 1, '5': 9, '10': 'hospitalID'},
    const {'1': 'specialization', '3': 2, '4': 1, '5': 9, '10': 'specialization'},
  ],
};

const Cancer$json = const {
  '1': 'Cancer',
  '2': const [
    const {'1': 'cancertype', '3': 1, '4': 1, '5': 9, '10': 'cancertype'},
    const {'1': 'originorgan', '3': 2, '4': 1, '5': 9, '10': 'originorgan'},
    const {'1': 'stage', '3': 3, '4': 1, '5': 5, '10': 'stage'},
    const {'1': 'origindate', '3': 4, '4': 1, '5': 9, '10': 'origindate'},
  ],
};

const InsertResponse$json = const {
  '1': 'InsertResponse',
  '2': const [
    const {'1': 'response', '3': 1, '4': 1, '5': 9, '10': 'response'},
    const {'1': 'status', '3': 2, '4': 1, '5': 14, '6': '.Status', '10': 'status'},
  ],
};

const WardInfo$json = const {
  '1': 'WardInfo',
  '2': const [
    const {'1': 'wardname', '3': 1, '4': 1, '5': 9, '10': 'wardname'},
    const {'1': 'constituency', '3': 2, '4': 1, '5': 9, '10': 'constituency'},
    const {'1': 'county', '3': 3, '4': 1, '5': 9, '10': 'county'},
  ],
};

const Location$json = const {
  '1': 'Location',
  '2': const [
    const {'1': 'lat', '3': 1, '4': 1, '5': 1, '10': 'lat'},
    const {'1': 'lon', '3': 2, '4': 1, '5': 1, '10': 'lon'},
  ],
};

const Hospital$json = const {
  '1': 'Hospital',
  '2': const [
    const {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'guid', '3': 2, '4': 1, '5': 9, '10': 'guid'},
    const {'1': 'wardinfo', '3': 3, '4': 1, '5': 11, '6': '.WardInfo', '10': 'wardinfo'},
    const {'1': 'location', '3': 4, '4': 1, '5': 11, '6': '.Location', '10': 'location'},
    const {'1': 'specialization', '3': 5, '4': 3, '5': 9, '10': 'specialization'},
  ],
};

const Hospitals$json = const {
  '1': 'Hospitals',
  '2': const [
    const {'1': 'hospitals', '3': 1, '4': 3, '5': 11, '6': '.Hospital', '10': 'hospitals'},
  ],
};

