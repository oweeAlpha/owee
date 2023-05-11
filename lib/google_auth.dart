import 'package:firebase3/pages/startSequence/onfido_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase3/pages/startSequence/redirect.dart';

import 'package:firebase3/pages/home_page.dart';
import 'package:firebase3/pages/direct_lending/dl_start.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn _googleSignIn = GoogleSignIn();

Future<void> signInWithGoogle(BuildContext context) async {
  // Sign out the user from their Google account
  await _googleSignIn.signOut();
  await Firebase.initializeApp();

  final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

  if (googleUser != null) {
    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
    final OAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    await _auth.signInWithCredential(credential);



    FirebaseAuth auth = FirebaseAuth.instance;
    String email = auth.currentUser!.email.toString();
    print("emai: $email");

    /*
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => startRedirect(context, email)),
    );
     */
    startRedirect(context, email);

  } else {
    throw FirebaseAuthException(
      message: 'User aborted the Google Sign In flow',
      code: '',
    );
  }
}