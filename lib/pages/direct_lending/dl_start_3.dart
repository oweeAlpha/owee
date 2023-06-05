import 'package:firebase3/grafics/MyColors.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase3/grafics/MyStyles.dart';
import 'package:firebase3/pages/direct_lending/dl_request.dart';
import 'package:firebase3/pages/direct_lending/dl_give.dart';
import 'package:firebase3/test/CardArrayH.dart';
import 'dart:ui';


class dl_start_3 extends StatefulWidget {
  @override
  _dl_start_3State createState() => _dl_start_3State();
}

class _dl_start_3State extends State<dl_start_3> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.transparent,
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
              height: 300,
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            Container(
              height: 300,
              decoration: BoxDecoration(
                color: Colors.green,
              ),
            ),
            Container(
              height: 300,
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            Container(
              height: 300,
              decoration: BoxDecoration(
                color: Colors.green,
              ),
            ),
            Container(
              height: 300,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      CardArrayH(),
                      // Add more CardArrayH widgets as needed
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      )
    );
  }
}