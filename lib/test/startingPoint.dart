import 'package:firebase3/grafics/MyColors.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase3/grafics/MyStyles.dart';
import 'package:firebase3/pages/direct_lending/dl_request.dart';
import 'package:firebase3/pages/direct_lending/dl_give.dart';
import 'package:firebase3/test/CardArrayH.dart';
import 'dart:ui';

class startingPoint extends StatefulWidget {
  @override
  _dl_startNewState createState() => _dl_startNewState();
}

class _dl_startNewState extends State<startingPoint> {
  @override
  void initState() {
    super.initState();
    // Set the status bar to be transparent
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
  }

  @override
  void dispose() {
    // Reset the status bar color when the widget is disposed
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.blue, // Replace with your desired color
    ));
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

    );
  }
}