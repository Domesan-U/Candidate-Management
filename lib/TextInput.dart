import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:untitled/constants.dart';
class TextInputCreated extends StatefulWidget {
  List<TextInputFormatter> inputFormattersC;
  IconData IconDataC;         //C- Created
  String labelTextC;
  String hintTextC;
  void Function(String)? onChangedC;
  String? Function(String?)? ValidatorC;
  TextInputType? keyboardTypeC;
  bool? readOnlyC;

  TextInputCreated({required this.inputFormattersC,required this.IconDataC, required this.labelTextC, required this.hintTextC, required this.onChangedC, required this.ValidatorC, this.keyboardTypeC, this.readOnlyC}  );
  @override
  State<TextInputCreated> createState() => _TextInputCreatedState();
}

class _TextInputCreatedState extends State<TextInputCreated> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: widget.readOnlyC??false,
      keyboardType: widget.keyboardTypeC??TextInputType.name,
      inputFormatters: widget.inputFormattersC,
      style: TextStyle(color: allColor),
      decoration: InputDecoration(
          icon: Icon(widget.IconDataC, color: allColor),
          labelText: widget.labelTextC,
          hintText: widget.hintTextC,
          hintStyle: TextStyle(color: allColor),
          labelStyle: TextStyle(color: allColor),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: allColor)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: allColor))),
      onChanged: widget.onChangedC,
      validator: widget.ValidatorC
    );
  }
}
