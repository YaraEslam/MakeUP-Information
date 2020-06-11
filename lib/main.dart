import 'package:flutter/material.dart';
import 'package:make_up/view/Home.dart';

void main() {
  runApp(MaterialApp(
    title: 'Make up',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: Home(),
  ));
}
