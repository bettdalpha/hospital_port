import 'package:csv/csv.dart';
import 'package:flutter/services.dart';

class Ward {
  String county, constituency, ward;

  Ward({this.county, this.constituency, this.ward});

  @override
  String toString() {
    return '$county,$constituency,$ward';
  }
}

class CSVReader {
  
  Future<String> readCSV(String file) async {
    return await rootBundle.loadString(file);
  }

  Future<List<Ward>> getWards() async {
    String allwards = await readCSV('assets/adm55.csv');
    List<Ward> wards = [];
    List vals = CsvToListConverter().convert(allwards);
    for (var val in vals) {
      wards.add(
        Ward(county: val[0], constituency: val[1] as String, ward: val[2]),
      );
    }
    return wards;
  }
}
