import 'package:firebase3/grafics/MyColors.dart';
import 'package:flutter/material.dart';
import 'package:firebase3/google_auth.dart';
import 'package:firebase3/grafics/MyColors.dart';

class choose_g_acc_page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => signInWithGoogle(context),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [MyColors.gradientLight, MyColors.gradientDark], //gradient
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'owee',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 36,
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  'tap anywhere to start',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    color: MyColors.font_black,
                    fontSize: 20,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w200,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}