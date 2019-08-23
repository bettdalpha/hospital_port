import 'package:flutter/material.dart';
import 'package:flutter_validate/flutter_validate.dart';

class DynamicInput extends StatefulWidget {
  final String label,hint;
  ///type denotes number or string or email 
  final DataType type;
  final TextEditingController controller;
  final bool multiline,hasborder;
  final double height;
  
  DynamicInput({
    @required this.label,
    @required this.hint,
    @required this.controller,
    this.type,
    this.multiline,
    this.hasborder,
    this.height
  });

  String get text => controller.text;
  
  @override
  _DynamicInputState createState() => _DynamicInputState();
}

class _DynamicInputState extends State<DynamicInput> {

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      keyboardType: keyBoardType(widget.type),
      validator: (str)=>validator(str),
      decoration: InputDecoration(
        hintText: widget.hint,
        labelText: widget.label,
        contentPadding: EdgeInsets.symmetric(vertical: 20,horizontal: 5),
        border: widget.hasborder
          ? OutlineInputBorder()
          : null,
        // helperText: widget.hint,
      ),
      textCapitalization: getCapitalization(widget.type),
      maxLines: null,
    );
  }

  TextCapitalization getCapitalization(DataType type){
    switch (type) {
      case DataType.EMAIL:
        return TextCapitalization.none;
        break;
      case DataType.INTEGER:
        return TextCapitalization.none;
        break;
      case DataType.TEXT:
        return TextCapitalization.sentences;
        break;
      case DataType.NAME:
        return TextCapitalization.words;
        break;
      case DataType.BARCODE:
        return TextCapitalization.characters;
        break;
      default:
        return TextCapitalization.sentences;
    }
  }

  TextInputType keyBoardType(DataType type) {
    if(widget.multiline==true){
      return TextInputType.multiline;
    }
    switch (type) {
      case DataType.EMAIL:
        return TextInputType.emailAddress;
        break;
      case DataType.INTEGER:
        return TextInputType.number;
        break;
      case DataType.TEXT:
        return TextInputType.text;
        break;
      case DataType.PHONE:
        return TextInputType.phone;
        break;
      default: return TextInputType.text;
    }
  }

  String validator(String s) {
    var validator = Validator(s,widget.type).validator;
    switch (widget.type) {
      case DataType.EMAIL:
        return validator.validateRuleFor('email').errorText;
        break;
      case DataType.INTEGER:
        return validator.validateRuleFor('int').errorText;
        break;
      case DataType.TEXT:
        return validator.validateRuleFor('text').errorText;
      case DataType.PHONE:
        return validator.validateRuleFor('phone').errorText;
      case DataType.NAME:
        return validator.validateRuleFor('name').errorText;
      case DataType.BARCODE:
        return validator.validateRuleFor('barcode').errorText;
      case DataType.COLOR:
        return null;
      case DataType.TYPE: 
        return null;
      default:
        return validator.validateRuleFor('text').errorText;
    }
  } 
}

enum DataType {
  EMAIL,PHONE,TEXT,INTEGER,NAME,COMPANY,BARCODE,COLOR,TYPE,CONDITION
}

class TypesValidator extends AbstractValidator<String> {  
  DataType type;
  String text;

  TypesValidator(this.text, this.type) : super(text);
}

class Validator {

  String text;
  TypesValidator _validator;
  DataType type;

  Validator(this.text,this.type){
    _validator = new TypesValidator(text,type);
    this.create();
  }

  TypesValidator get validator => _validator;

  TypesValidator create(){

    _validator.ruleFor('name', ()=>text)
        ..notEmpty()
        ..withMessage('Please enter a name')
        ..length(2, 100)
        ..withMessage('Enter a reasonable name');

    _validator.ruleFor('email', ()=>text)
        ..notEmpty()
        ..withMessage('Email cannot be empty')
        ..emailAddress()
        ..withMessage('Enter a valid email');

    _validator.ruleFor('text', ()=>text)
        ..notEmpty()
        ..withMessage('Cannot be empty');

    _validator.ruleFor('phone', ()=>text)
        ..notEmpty()
        ..withMessage('Phone number cannot be empty')
        ..matches('[0-9]{0,14}\$')
        ..withMessage('Phone number doesn\'t seem correct');

    _validator.ruleFor('int', ()=>text)
        ..matches('(?<=\\s|^)[-+]?\\d+(?=\\s|\$)')
        ..withMessage('Enter a valid number');
    _validator.ruleFor('barcode', ()=>text)
        ..notEmpty()
        ..withMessage('Scan or type the barcode value');
    _validator.ruleFor('color', ()=>text)
        ..notEmpty()
        ..withMessage('Type Color or N/A if not applicable');
    _validator.ruleFor('condition', ()=>text)
        ..notEmpty()
        ..withMessage('Enter condition or N/A');
    _validator.ruleFor('type', ()=>text)
        ..notEmpty()
        ..withMessage('Enter type of sample, feed ');
    _validator.ruleFor('company', ()=>text)
        ..notEmpty()
        ..withMessage('Enter company name');
        
    return _validator;

  }
  void addCustomValidation(String key,String sampleInfo){
    _validator.ruleFor(key, ()=>text)
        ..notEmpty()
        ..withMessage(sampleInfo);
  }

  String validate(){
    switch (type) {
      case DataType.EMAIL:
        return validator.validateRuleFor('email').errorText;
        break;
      case DataType.INTEGER:
        return validator.validateRuleFor('int').errorText;
        break;
      case DataType.TEXT:
        return validator.validateRuleFor('text').errorText;
      case DataType.PHONE:
        return validator.validateRuleFor('phone').errorText;
      case DataType.NAME:
        return validator.validateRuleFor('name').errorText;
      case DataType.COLOR:
        return validator.validateRuleFor('color').errorText;
      case DataType.COMPANY:
        return validator.validateRuleFor('company').errorText;
      case DataType.CONDITION:
        return validator.validateRuleFor('condition').errorText;
      default:
        return validator.validateRuleFor('text').errorText;
    }
  }
}