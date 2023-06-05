import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BlurryBgTopBar extends StatefulWidget {
  @override
  _BlurryBgTopBarState createState() => _BlurryBgTopBarState();
}

class _BlurryBgTopBarState extends State<BlurryBgTopBar> {
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
        ),
      ),
    );
  }
}