import 'package:firebase3/grafics/MyColors.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase3/grafics/MyStyles.dart';
import 'package:firebase3/pages/direct_lending/dl_request.dart';


class dl_start extends StatefulWidget {
  @override
  _dl_startState createState() => _dl_startState();
}

class _dl_startState extends State<dl_start> {
  double _sliderValue = 0.0;

  @override
  Widget build(BuildContext context) {
    // Get the height of the status bar
    final double statusBarHeight = MediaQuery.of(context).padding.top;

    // Set the status bar color to transparent
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: MyColors.topBar,
        systemNavigationBarIconBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark, // Use white icons
      ),
    );

    return Container(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          children: [
            //topbar
            Container(
              padding: EdgeInsets.fromLTRB(10.0, statusBarHeight + 5.0, 10.0, 10.0),
              color: MyColors.topBar,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'direct lending',
                          style: TextStyle(
                            fontSize: 23.0,
                            color: MyColors.bigText,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            text: 'More ',
                            style: TextStyle(
                              fontSize: 16,
                              color: MyColors.smallText,
                              decoration: TextDecoration.underline,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: 'Features',
                                style: TextStyle(
                                  color: MyColors.smallText,
                                  decoration: TextDecoration.underline,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    //TODO: actually dont navigate to some url but an in app screen
                                  },
                              ),
                              TextSpan(
                                text: ' are coming',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.black,
                                  decoration: TextDecoration.none,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 0.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.add_alert_rounded,
                          color: MyColors.icons,
                          size: 30.0,
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        Icon(
                          Icons.account_circle,
                          color: MyColors.icons,
                          size: 50.0,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            //main container
            Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    image: DecorationImage(
                      image: AssetImage('assets/images/backgroundBlurryAndDark.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Center(
                    child: Container(
                        child: Container(
                          padding: EdgeInsets.all(20),
                          child: Container(
                            padding: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: MyColors.cardViewBackground,
                              borderRadius: BorderRadius.circular(30),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  offset: Offset(0, 3), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Slider(
                                  value: _sliderValue,
                                  min: 0.0,
                                  max: 100.0,
                                  onChanged: (double newValue) {
                                    setState(() {
                                      _sliderValue = newValue;
                                    });
                                  },
                                ),
                                SizedBox(height: 20.0),
                                TextFormField(
                                  textAlign: TextAlign.center,
                                  decoration: InputDecoration(
                                    fillColor: Colors.white,
                                    filled: true,
                                    contentPadding: EdgeInsets.symmetric(vertical: 0.0),
                                    hintText: '@nickname',
                                    //not clicked outline
                                    hintStyle: TextStyle(
                                      fontSize: 16.0,
                                      color: MyColors.textFieldText,
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30.0),
                                      borderSide: BorderSide(
                                        color: MyColors.textFieldOutline , // set the border color here
                                        width: 3.0, // set the border width here
                                      ),
                                    ),
                                    //outline when clicked
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30.0),
                                      borderSide: BorderSide(
                                        color: MyColors.textFieldOutline, // set the border color here
                                        width: 1.0, // set the border width here
                                      ),
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30.0),
                                      borderSide: BorderSide(
                                        color: MyColors.textFieldOutline, // set the border color here
                                        width: 1.0, // set the border width here
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 20.0),
                                //the two buttons
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Expanded(
                                      child: TextButton(
                                        onPressed: () {
                                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => dl_request()));
                                        },
                                        child: Text(
                                          'give',
                                          style: MyStyles.darkGreenButtonText,
                                        ),
                                        style: ElevatedButton.styleFrom(
                                          padding: EdgeInsets.symmetric(vertical: 0.0),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(30),
                                          ),
                                          minimumSize: Size(double.infinity, 45),
                                          backgroundColor: MyColors.darkGreenButton , // replace with your desired color
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 8), // Add space between the buttons
                                    Expanded(
                                      child: TextButton(
                                        onPressed: () {
                                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => dl_request()));
                                        },
                                        child: Text(
                                          'request',
                                          style: TextStyle(
                                            color: MyColors.darkGreenButtonText, // set the color of the text here
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20.0,
                                          ),
                                        ),
                                        style: ElevatedButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(30),
                                          ),
                                          minimumSize: Size(double.infinity, 45),
                                          backgroundColor: MyColors.darkGreenButton, // replace with your desired color
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        )
                    ),
                  ),
                )
            ),
          ],
        ),
      ),
    );
  }
}