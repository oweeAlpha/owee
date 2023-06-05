import 'package:firebase3/grafics/MyColors.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase3/grafics/MyStyles.dart';
import 'package:firebase3/pages/direct_lending/dl_request.dart';
import 'package:firebase3/pages/direct_lending/dl_give.dart';
import 'package:firebase3/test/CardArrayH.dart';
import 'dart:ui';

class dl_start_new extends StatefulWidget {
  @override
  _dl_startNewState createState() => _dl_startNewState();
}

class _dl_startNewState extends State<dl_start_new> {
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
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.transparent,
      ),
      child: Scaffold(
        body: Stack(
          children: [
            SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  //abstand von oben damit der content unterhalb des blurry containers beginnt
                  SizedBox(height: MediaQuery.of(context).padding.top + 50),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 150,
                    color: Colors.white,
                    child: Center(
                      child: Container(
                        padding: EdgeInsets.fromLTRB(20, 16, 20, 16),
                        child: Stack(
                          children: [
                            // Base container with rounded corners
                            Container(
                              constraints: BoxConstraints.tightFor(
                                width: double.infinity,
                                height: double.infinity,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(25),
                              ),
                            ),

                            // Gradient container with rounded corners and inner shadow
                            Positioned(
                              top: -2,
                              left: -2,
                              right: 1,
                              bottom: 2,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white.withOpacity(0.0),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.0),
                                      offset: Offset(2, 2),
                                      blurRadius: 15,
                                      spreadRadius: 0,
                                    ),
                                    BoxShadow(
                                      color: Colors.white.withOpacity(0.8),
                                      offset: Offset(2, 2),
                                      blurRadius: 10,
                                      spreadRadius: 0,
                                    ),
                                    BoxShadow(
                                      color: Colors.white.withOpacity(0.9),
                                      offset: Offset(-2, 2),
                                      blurRadius: 10,
                                      spreadRadius: 0,
                                    ),
                                    BoxShadow(
                                      color: Colors.white,
                                      offset: Offset(2, -2),
                                      blurRadius: 10,
                                      spreadRadius: 0,
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            // Row widget to align the text
                            //ObenRechts zwei schriften


                          ],
                        ),
                      )
                    )
                  ),
                  Container(
                    color: Colors.white,
                    child: CardArrayH(),
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
                ],
              ),
            ),
            ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Container(
                  height: 50 + MediaQuery.of(context).padding.top,
                  color: Colors.blue.withOpacity(0.3),
                  child: Padding(
                    padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
                    child: Center(
                      child: Text(
                        'Container',
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        )
      ),
    );
  }
}