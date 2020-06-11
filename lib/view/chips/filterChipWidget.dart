import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:make_up/view/Search.dart';

class filterChipWidget extends StatefulWidget {
  final String chipName;

  filterChipWidget({Key key, this.chipName}) : super(key: key);

  @override
  filterChipWidgetState createState() => filterChipWidgetState();
}

class filterChipWidgetState extends State<filterChipWidget> {
  var _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return FilterChip(
      label: Text(widget.chipName),
      labelStyle: TextStyle(
          color: Colors.black, //Color(0xff6200ee),
          fontSize: 14.0,
          fontWeight: FontWeight.bold),
      selected: _isSelected,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      backgroundColor: Color(0xffededed),
      onSelected: (isSelected) {
        setState(() {
          _isSelected = isSelected;
          if (_isSelected) {
            SearchState.tags.add(widget.chipName);
          } else {
            SearchState.tags.removeWhere((item) => item == widget.chipName);
          }
        });
      },
      selectedColor: Colors.yellowAccent, //Color(0xffeadffd),
    );
  }
}
