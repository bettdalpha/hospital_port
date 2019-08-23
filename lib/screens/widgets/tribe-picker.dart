

import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:flutter/material.dart';

class TribePicker extends StatefulWidget {
  final TextEditingController controller;

  TribePicker({@required this.controller});

  @override
  _TribePickerState createState() => _TribePickerState();
}

class _TribePickerState extends State<TribePicker> {
  final autoCompKey = GlobalKey<AutoCompleteTextFieldState<String>>();

  @override
  Widget build(BuildContext context) {
    AutoCompleteTextField tribePicker = AutoCompleteTextField<String>(
      key: autoCompKey,
      itemBuilder: (context, tribe) {
        return Container(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Text('$tribe'),
        );
      },
      itemFilter: (tribe, str) {
        return tribe.toLowerCase().startsWith(str.toLowerCase());
      },
      itemSorter: (tribea, tribeb) {
        return tribea.toLowerCase().compareTo(tribeb.toLowerCase());
      },
      itemSubmitted: (tribe) {
        setState(() {
          widget.controller.text = tribe;
        });
      },
      clearOnSubmit: false,
      suggestionsAmount: 10,
      controller: widget.controller,
      suggestions: kenyantribes,
      decoration: InputDecoration(
        fillColor: Colors.orangeAccent,
        labelText: widget.controller.text == null
            ? 'Choose Tribe'
            : widget.controller.text,
        hintText: 'Type your tribe',
      ),
    );
    return tribePicker;
  }
}
List<String> kenyantribes = [
  "Kamba",
  "Kalenjin",
  "Kikuyu",
  "Luo",
  "Luhya",
  "Embu",
  "Meru",
  "Maasai",
  "Kisii",
  "Taita",
  "Swahili",
  "Somali"
];