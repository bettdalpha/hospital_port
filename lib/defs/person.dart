import 'package:hospital_app/utils/wards-reader.dart';

class Person {
  String firstName, lastName;
  String gender, race, tribe;
  String profession;
  String birthplace; //Town
  County county;
  String bloodGroup;
  int age;

  Person(
    
    this.firstName,
    this.lastName,
    this.gender,
    this.race,
    this.tribe,
    this.profession,
    this.birthplace,
    this.age,
    this.bloodGroup
    
  );

  String get fullname => firstName + ' ' + lastName;

  Map<String,dynamic> toMap() {
    return {
      "names": fullname,
      "gender": gender,
      "race": race,
      "tribe": tribe,
      "profession": profession,
      "birthplace": birthplace,
      "age": age,
      "county": county.countyName
    };
  }
}

class Doctor {
  String firstName,lastName,hospital,specialization;
  Ward ward;

  Doctor({
    this.firstName,this.lastName,this.hospital,this.specialization,this.ward
  });

  Map<String,dynamic> toMap() {
    return {
      "firstName" : this.firstName,
      "lastName" : this.lastName,
      "hospital" : this.hospital,
      "specialization" : this.specialization,
      "ward" : this.ward
    };
  }
  factory Doctor.fromMap(Map<String,dynamic> data) {
    String wardInfo =data['ward'] as String;
    List<String> split = wardInfo.split(',');
    var ward = Ward(
      county: split[0],
      constituency: split[1],
      ward: split[2]
    );
    return Doctor(
      firstName: data['firstName'],
      lastName: data['lastName'],
      hospital: data['hospital'],
      specialization: data['specialization'],
      ward: ward
    );
  }
}

class Town {

  final int countyID;
  final String townName;

  Town({
    this.countyID,this.townName
  });

  @override
  String toString() {
    return townName;
  }

}
class County {

  final String countyName;
  final int countyID,population;

  County({
    this.countyID,
    this.countyName,
    this.population
  });

  @override
  String toString() {
    return """CountyNO>\t$countyID
      CountyName>\t$countyName
      Population>\t$population
    """;
  }

}

class CancerPatient {

  Person patient;
  Cancer cancer;

  CancerPatient({
    this.patient,
    this.cancer
  });

  @override
  String toString() {
    return patient.fullname + '\t' + cancer.cancerType.toString();
  }

}

class Cancer {

  CancerType cancerType;
  String originOrgan; ///
  int stage;
  DateTime originDate;

  Cancer({
    this.cancerType,
    this.originOrgan,
    this.stage,
    this.originDate
  });
  
}

enum CancerType {
  AnalCancer,
  AppendixCancer,
  BasalCellCancer,
  BileDuctCancer,
  BladderCancer,
  BoneCancer,
  BrainCancer,
  BreastCancer,
  CervicalCancer,
  ColonRectalCancer,
  EndometrialCancer,
  EsophagealCancer,
  HeadAndNeckCancer,  
  GallbladderCancer,
  GestationalCancer,
  KidneyCancer,
  Leukemia,
  Liver,
  LungCancer,
  Melanoma,
  Mesothelioma,
  Myeloma,
  Neuroendocrine,
  Lymphoma,
  OralCancer,
  OvarianCancer,
  PancreaticCancer,
  ProstateCancer,
  SinusCancer,
  SkinCancer,
  SoftTissueSarcoma,
  SpinalCancer,
  StomachCancer,
  TesticularCancer,
  ThroatCancer,
  ThyroidCancer,
  UterinCancer,
  VaginalCancer,
  OTHERS
}

Map<CancerType,String> cancersMap = {
  CancerType.AnalCancer : "Anal Cancer",
  CancerType.AppendixCancer : 'Appendix Cancer',
  CancerType.BasalCellCancer : 'Basal Cell Cancer',
  CancerType.BileDuctCancer : 'Bile duct cancer',
  CancerType.BladderCancer : "Bladder Cancer",
  CancerType.BoneCancer : 'Bone Cancer',
  CancerType.BrainCancer : 'Brain Cancer',
  CancerType.BreastCancer : 'Breast Cancer',
  CancerType.CervicalCancer : 'Cervial Cancer',
  CancerType.ColonRectalCancer : 'Colon Rectal Cancer',
  CancerType.EndometrialCancer : 'Endrometrial Cancer',
  CancerType.EsophagealCancer : 'Esophageal Cancer',
  CancerType.GallbladderCancer : 'Gall bladder Cancer',
  CancerType.GestationalCancer : 'Gestational Cancer',
  CancerType.HeadAndNeckCancer : 'Head and Neck Cancer',
  CancerType.KidneyCancer : 'Kidney Cancer',
  CancerType.Leukemia : 'Leukemia',
  CancerType.Liver : 'Liver Cancer',
  CancerType.LungCancer : 'Lung Cancer',
  CancerType.Lymphoma : 'Hodgkin Lymphoma',
  CancerType.Melanoma : 'Melanoma',
  CancerType.Mesothelioma : 'Mesothelioma',
  CancerType.Myeloma : 'Myeloma',
  CancerType.Neuroendocrine : 'Neuro-endocrine tumors',
  CancerType.OralCancer : 'Oral Cancer',
  CancerType.OTHERS : 'Other Cancers',
  CancerType.OvarianCancer: 'Ovarian Cancer',
  CancerType.PancreaticCancer: 'Pancreatic Cancer',
  CancerType.ProstateCancer : 'Prostate Cancer',
  CancerType.SinusCancer: 'Sinus Cancer',
  CancerType.SkinCancer : 'Skin Cancer',
  CancerType.SoftTissueSarcoma: 'Soft tissue sarcoma',
  CancerType.SpinalCancer: 'Spinal Cancer',
  CancerType.StomachCancer: 'Stomach Cancer',
  CancerType.TesticularCancer: 'Testicular Cancer',
  CancerType.ThroatCancer: 'Throat Cancer',
  CancerType.ThyroidCancer: 'Thyroid Cancer',
  CancerType.UterinCancer: 'Uterin Cancer',
  CancerType.VaginalCancer: 'Vaginal Cancer',
};



String cancerNameToString(CancerType type) {
  return cancersMap[type] ?? 'Undefined';
}

enum CommonOrigins {
  Carcinomas,Sarcomas,Lymphatic,Blood
}


