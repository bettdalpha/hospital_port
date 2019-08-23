import 'package:flutter/material.dart';
import 'package:hospital_app/utils/wards-reader.dart';

class LocChooser extends StatefulWidget {
  final List<Ward> wards;
  Ward ward;
  Function(Ward) callback;

  LocChooser({this.wards, this.ward,this.callback});

  @override
  _LocChooserState createState() => _LocChooserState();
}

class _LocChooserState extends State<LocChooser> {
  
  List<String> counties;
  List<String> constituencies;
  String chosenCounty;
  String chosenConstituency;

  @override
  void initState() {
    counties = widget.wards
        .map((ward) {
          return ward.county;
        })
        .toSet()
        .toList();

    counties.sort((stra, strb) => stra.compareTo(strb));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    constituencies = chosenCounty == null
        ? []
        : widget.wards
            .where((ward) => ward.county == chosenCounty)
            .map((ward) => ward.constituency)
            .toSet()
            .toList();

    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Wrap(
          direction: Axis.vertical,
          children: <Widget>[
            DropdownButton<String>(
                items: counties
                    .map(
                      (county) => DropdownMenuItem<String>(
                        child: Text('$county'),
                        value: county,
                      ),
                    )
                    .toList(),
                onChanged: (county) {
                  setState(() {
                    chosenCounty = county;
                    // widget.ward.county = county;
                  });
                },
                hint: chosenCounty == null
                    ? Text('Choose County')
                    : Text('$chosenCounty')
                // value: tribeController.text == null ? 'Choose Tribe' : tribeController.text,
                ),
            DropdownButton<String>(
              items: constituencies != null
                  ? constituencies
                      .map(
                        (county) => DropdownMenuItem<String>(
                          child: Text('$county'),
                          value: county,
                        ),
                      )
                      .toList()
                  : [],
              onChanged: (constit) {
                setState(() {
                  chosenConstituency = constit;
                  // widget.ward.constituency = constit;
                });
              },
              hint: chosenCounty == null
                  ? Text('Choose County')
                  : chosenConstituency == null
                      ? Text('Constituency')
                      : Text('$chosenConstituency'),
              // value: tribeController.text == null ? 'Choose Tribe' : tribeController.text,
            ),
            DropdownButton<String>(
              items: chosenConstituency != null
                  ? widget.wards
                      .where((ward) => ward.constituency == chosenConstituency)
                      .toList()
                      .map(
                        (ward) => DropdownMenuItem<String>(
                          child: Text('${ward.ward}'),
                          value: ward.ward,
                        ),
                      )
                      .toList()
                  : [],
              onChanged: (ward) {
                setState(() {
                  widget.ward = Ward(
                    constituency: chosenConstituency,
                    ward: ward,
                    county: chosenCounty,
                  );
                });
                widget.callback(widget.ward);
              },
              hint: chosenCounty == null
                  ? Text('Choose County First')
                  : chosenConstituency == null
                      ? Text('Choose Constituency First')
                      : widget.ward == null
                          ? Text('Choose Ward')
                          : widget.ward.ward == null
                              ? Text('Choose Ward')
                              : Text('${widget.ward.ward}'),
              // value: tribeController.text == null ? 'Choose Tribe' : tribeController.text,
            ),
          ],
        ),
      ),
    );
  }
}
