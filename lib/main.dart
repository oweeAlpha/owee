import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:firebase3/google_auth.dart';
import 'package:firebase3/pages/home_page.dart';
import 'package:firebase3/pages/direct_lending/dl_start.dart';
import 'package:firebase3/auth.dart';
import 'package:firebase3/pages/startSequence/login_register_page.dart';
import 'package:firebase3/pages/startSequence/choose_g_acc_page.dart';

import 'package:firebase3/pages/startSequence/onfido_page.dart';
import 'package:firebase3/grafics/MyColors.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: MyColors.gradientDark, // set navigation bar color
    ));
    return MaterialApp(
      title: 'Your App Name',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
        appBarTheme: AppBarTheme(
          color: Colors.white, // set the color of the AppBar
          brightness: Brightness.light, // set the brightness of the AppBar
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.white, // set the background color of the bottom navigation bar
          selectedItemColor: Colors.orange, // set the selected item color of the bottom navigation bar
          unselectedItemColor: Colors.grey, // set the unselected item color of the bottom navigation bar
        ),
      ),
      home: _CheckAuthState(),
      // add the following lines to control the color of the top bar and bottom navigation bar
      // you can adjust the colors as needed
      themeMode: ThemeMode.light,
      color: Colors.white,
    );
  }
}

class _CheckAuthState extends StatefulWidget {
  @override
  _CheckAuthStateState createState() => _CheckAuthStateState();
}

class _CheckAuthStateState extends State<_CheckAuthState> {
  User? _currentUser;

  @override
  void initState() {
    super.initState();
    checkAuth();
  }

  Future<void> checkAuth() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? currentUser = auth.currentUser;

    setState(() {
      _currentUser = currentUser;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_currentUser == null) {
      return choose_g_acc_page();
    } else {
      return OnfidoPage(shouldRedirect: true,);
    }
  }
}