import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

// this is constant for input decoration
// of textfield for search in main_screen.
const kInputDecorationSearchMainScreen = InputDecoration(
  filled: true,
  fillColor: Color(0xffF6F6F6),
  suffixIcon: Icon(LineAwesomeIcons.search),
  hintText: 'Search Provider ',
  contentPadding: EdgeInsets.symmetric(horizontal: 20.0),
  hintStyle: TextStyle(
    color: Colors.grey,
  ),
  focusColor: Colors.white,
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(30.0),
    ),
  ),
);

const kAppName = 'Salesberry Department Store';
const kAppNameShort = 'Salesberry';


