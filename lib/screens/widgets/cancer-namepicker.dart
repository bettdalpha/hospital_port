import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:flutter/material.dart';

class CancerNamePicker extends StatefulWidget {
  final TextEditingController controller;
  final Function(String) onSelected;
  final bool clearOnPick;

  CancerNamePicker(
      {@required this.controller, this.onSelected, this.clearOnPick});

  @override
  _CancerNamePickerState createState() => _CancerNamePickerState();
}

class _CancerNamePickerState extends State<CancerNamePicker> {
  final autoCompKey = GlobalKey<AutoCompleteTextFieldState<String>>();

  @override
  Widget build(BuildContext context) {
    AutoCompleteTextField _profPicker = AutoCompleteTextField<String>(
      key: autoCompKey,
      itemBuilder: (context, prof) {
        return Container(
          padding: const EdgeInsets.all(8.0),
          child: Text('$prof'),
        );
      },
      itemFilter: (prof, str) {
        return prof.toLowerCase().startsWith(str.toLowerCase());
      },
      itemSorter: (profa, profb) {
        return profa.toLowerCase().compareTo(profb.toLowerCase());
      },
      itemSubmitted: (prof) {
        if (widget.clearOnPick != null) {
          if (!widget.clearOnPick) {
            setState(() {
              widget.controller.text = prof;
            });
          }
        }
        if (widget.onSelected != null) {
          widget.onSelected(prof);
        }
      },
      clearOnSubmit: false,
      suggestionsAmount: 10,
      controller: widget.controller,
      suggestions: CancerType.values
          .map((cancer) => cancerNameToString(cancer))
          .toList(),
      decoration: InputDecoration(
        fillColor: Colors.orangeAccent,
        labelText: widget.controller.text == null
            ? 'Choose Cancer'
            : widget.controller.text,
        hintText: 'Choose Cancer',
      ),
    );
    return _profPicker;
  }

  String cancerNameToString(CancerType type) {
    return cancersMap.containsKey(type) ? cancersMap[type] : 'Others';
  }
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

Map<CancerType, String> cancersMap = {
  CancerType.AnalCancer: "Anal Cancer",
  CancerType.AppendixCancer: 'Appendix Cancer',
  CancerType.BasalCellCancer: 'Basal Cell Cancer',
  CancerType.BileDuctCancer: 'Bile duct cancer',
  CancerType.BladderCancer: "Bladder Cancer",
  CancerType.BoneCancer: 'Bone Cancer',
  CancerType.BrainCancer: 'Brain Cancer',
  CancerType.BreastCancer: 'Breast Cancer',
  CancerType.CervicalCancer: 'Cervial Cancer',
  CancerType.ColonRectalCancer: 'Colon Rectal Cancer',
  CancerType.EndometrialCancer: 'Endrometrial Cancer',
  CancerType.EsophagealCancer: 'Esophageal Cancer',
  CancerType.GallbladderCancer: 'Gall bladder Cancer',
  CancerType.GestationalCancer: 'Gestational Cancer',
  CancerType.HeadAndNeckCancer: 'Head and Neck Cancer',
  CancerType.KidneyCancer: 'Kidney Cancer',
  CancerType.Leukemia: 'Leukemia',
  CancerType.Liver: 'Liver Cancer',
  CancerType.LungCancer: 'Lung Cancer',
  CancerType.Lymphoma: 'Hodgkin Lymphoma',
  CancerType.Melanoma: 'Melanoma',
  CancerType.Mesothelioma: 'Mesothelioma',
  CancerType.Myeloma: 'Myeloma',
  CancerType.Neuroendocrine: 'Neuro-endocrine tumors',
  CancerType.OralCancer: 'Oral Cancer',
  CancerType.OTHERS: 'Other Cancers',
  CancerType.OvarianCancer: 'Ovarian Cancer',
  CancerType.PancreaticCancer: 'Pancreatic Cancer',
  CancerType.ProstateCancer: 'Prostate Cancer',
  CancerType.SinusCancer: 'Sinus Cancer',
  CancerType.SkinCancer: 'Skin Cancer',
  CancerType.SoftTissueSarcoma: 'Soft tissue sarcoma',
  CancerType.SpinalCancer: 'Spinal Cancer',
  CancerType.StomachCancer: 'Stomach Cancer',
  CancerType.TesticularCancer: 'Testicular Cancer',
  CancerType.ThroatCancer: 'Throat Cancer',
  CancerType.ThyroidCancer: 'Thyroid Cancer',
  CancerType.UterinCancer: 'Uterin Cancer',
  CancerType.VaginalCancer: 'Vaginal Cancer',
};
