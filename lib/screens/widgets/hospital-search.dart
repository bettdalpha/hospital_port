import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:hospital_app/protos/generated/cancers.pbgrpc.dart';
import 'package:flutter/material.dart';

class HospitalSearch extends StatefulWidget {
  final Hospitals hospitals;
  final Function(Hospital) callback;
  final Function(String) updateHospitalList;

  HospitalSearch(
      {@required this.hospitals, this.callback, this.updateHospitalList});

  @override
  _HospitalSearchState createState() => _HospitalSearchState();
}

class _HospitalSearchState extends State<HospitalSearch> {
  var _key = GlobalKey<AutoCompleteTextFieldState<Hospital>>();
  var _ctrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var hospitalSearch = AutoCompleteTextField<Hospital>(
      itemBuilder: (context, item) {
        return Row(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text('${item.name}'),
            ),
            SizedBox(
              width: 30,
            ),
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text('${item.wardinfo.county},${item.wardinfo.constituency},${item.wardinfo.wardname}'),
            ),
          ],
        );
      },
      itemFilter: (hosp, str) {
        return true;
      },
      itemSorter: (stra, strb) {
        return stra.name.compareTo(strb.name);
      },
      textChanged: (str) {
        // widget.updateHospitalList(str);
      },
      suggestionsAmount: 10,
      suggestions: widget.hospitals.hospitals,
      key: _key,
      itemSubmitted: (hospital) {
        widget.callback(hospital);
      },
      controller: _ctrl,
      decoration: InputDecoration(
          suffixIcon: IconButton(
        icon: Icon(Icons.search),
        onPressed: () {
          setState(() {
            widget.updateHospitalList(_ctrl.text);
          });
          print(widget.hospitals.hospitals);
        },
      )),
    );

    return Container(
      child: Column(
        children: <Widget>[
          Text('Search for hospital name'),
          SizedBox(
            height: 10,
          ),
          hospitalSearch
        ],
      ),
    );
  }
}
