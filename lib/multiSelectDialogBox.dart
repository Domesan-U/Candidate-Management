import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled/constants.dart';
class MultiSelect extends StatefulWidget {
  var kSelectedItems;
  MultiSelect({required this.kSelectedItems});
  @override
  State<StatefulWidget> createState() => _MultiSelectState();
}

class _MultiSelectState extends State<MultiSelect> {

  // this variable holds the selected items

// This function is triggered when a checkbox is checked or unchecked
  void _itemChange(String itemValue, bool isSelected) {
    setState(() {
      if (isSelected) {
        widget.kSelectedItems.add(itemValue);
      } else {
        widget.kSelectedItems.remove(itemValue);
      }
    });
  }

  // this function is called when the Cancel button is pressed
  void _cancel() {
    Navigator.pop(context);
  }

// this function is called when the Submit button is tapped
  void _submit() {
    Navigator.pop(context, widget.kSelectedItems);
  }

  @override
  Widget build(BuildContext context) {
    return  AlertDialog(
            title: const Text('Select Topics'),
            content: SingleChildScrollView(
              child: ListBody(
                children: items
                    .map((item) => CheckboxListTile(
                  activeColor: containerBg,
                  value: widget.kSelectedItems.contains(item),
                  title: Text(item),
                  controlAffinity: ListTileControlAffinity.leading,
                  onChanged: (isChecked) => _itemChange(item, isChecked!),
                ))
                    .toList(),
              ),
            ),
            actions: [
              Container(
                color: containerBg,
                child: TextButton(
                  onPressed: _cancel,
                  child: Text('Cancel',style: GoogleFonts.jost(textStyle: TextStyle(color: Colors.white)),),
                ),
              ),
              Container(
                color: containerBg,
                child: TextButton(
                  onPressed: _submit,
                  child: Text('Submit',style: GoogleFonts.jost(textStyle: TextStyle(color: Colors.white))),
                ),
              ),
            ],

    );

  }
}
