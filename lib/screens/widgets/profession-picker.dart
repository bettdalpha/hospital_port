

import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:hospital_app/screens/patient-screen.dart';
import 'package:flutter/material.dart';

class ProfessionPicker extends StatefulWidget {
  final TextEditingController controller;

  ProfessionPicker({@required this.controller});

  @override
  _ProfessionPickerState createState() => _ProfessionPickerState();
}

class _ProfessionPickerState extends State<ProfessionPicker> {
  final autoCompKey = GlobalKey<AutoCompleteTextFieldState<String>>();

  @override
  Widget build(BuildContext context) {
    AutoCompleteTextField profPicker = AutoCompleteTextField<String>(
      key: autoCompKey,
      itemBuilder: (context, prof) {
        return Container(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('$prof'),
          ),
        );
      },
      itemFilter: (prof, str) {
        return prof.toLowerCase().startsWith(str.toLowerCase());
      },
      itemSorter: (profa, profb) {
        return profa.toLowerCase().compareTo(profb.toLowerCase());
      },
      itemSubmitted: (prof) {
        setState(() {
          widget.controller.text = prof;
        });
      },
      clearOnSubmit: false,
      suggestionsAmount: 10,
      controller: widget.controller,
      suggestions:
          Professions.values.map((prof) => professionToString(prof)).toList(),
      decoration: InputDecoration(
        fillColor: Colors.orangeAccent,
        labelText: widget.controller.text == null
            ? 'Choose Profession'
            : widget.controller.text,
        hintText: 'Choose Profession',
        border: OutlineInputBorder(),
      ),
    );
    return profPicker;
  }

  String professionToString(Professions prof) {
    String profession = prof.toString();
    return profession.substring(profession.indexOf('.') + 1);
  }
}
