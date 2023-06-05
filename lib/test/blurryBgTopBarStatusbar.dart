import 'package:firebase3/grafics/MyColors.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase3/grafics/MyStyles.dart';
import 'package:firebase3/pages/direct_lending/dl_request.dart';
import 'package:firebase3/pages/direct_lending/dl_give.dart';
import 'dart:ui';

class BlurryBgTopBar extends StatefulWidget {
  @override
  _BlurryBgTopBarState createState() => _BlurryBgTopBarState();
}

class _BlurryBgTopBarState extends State<BlurryBgTopBar> {

  @override
  void initState() {
    super.initState();
    // Set the status bar color
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.blue, // Replace with your desired color
    ));
  }


  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark.copyWith(
          statusBarColor: Colors.blue, // Replace with your desired color
        ),
        child: SafeArea(
        child: Scaffold(
          body: Stack(
            children: [
              ListView.builder(
                physics: ClampingScrollPhysics(),
                itemCount: 20,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    // The first card is moved below the container
                    return SizedBox(height: 50);
                  } else {
                    return Card(
                      child: ListTile(
                        title: Text('Card $index'),
                        subtitle: Text('Subtitle $index'),
                      ),
                    );
                  }
                },
              ),
              Container(
                height: 50,
                child: ClipRect(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: Container(
                      color: Colors.blue.withOpacity(0.3),
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
          ),
        ),
      )
    );
  }
}