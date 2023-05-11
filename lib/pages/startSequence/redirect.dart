import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase3/pages/direct_lending/dl_start.dart';
import 'package:firebase3/pages/home_page.dart';
import 'package:firebase3/main.dart';
import 'package:firebase3/pages/testing_purposes/yellow_bg.dart';
import 'package:firebase3/pages/testing_purposes/green_bg.dart';
import 'package:firebase3/pages/testing_purposes/blue_bg.dart';
import 'package:firebase3/pages/testing_purposes/red_bg.dart';


Future<void> startRedirect(BuildContext context, String email) async {
  print("before awaiting firestore");
  try {
    DocumentSnapshot document = await FirebaseFirestore.instance.collection('users').doc(email).get();

    print("after awaiting firestore");
    if (document.exists) {
      print("document exists");
    }
    if (document.exists && document.get('personal_info') == null) {
      print("document.exists && document == null");
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => yellow_bg()));
    }
    if (document.exists && document.get('personal_info') != null) {
      Map<String, dynamic> personalInfo = document.get('personal_info');
      print("personal info: $personalInfo");
      if (personalInfo['CURRENCY'] != null ) {

        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => dl_start()));
      }
    }
  } catch (e) {
    print('Error fetching user data: $e');
    // Handle the error here, for example:
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Error'),
          content: Text('Failed to fetch user data. Please try again later.'),
          actions: [
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
              },
            ),
          ],
        );
      },
    );
  }
}