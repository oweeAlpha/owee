import 'package:flutter/material.dart';
import 'package:firebase3/pages/home_page.dart';
import 'package:firebase3/pages/direct_lending/dl_start_new.dart';

class OnfidoPage extends StatelessWidget {
  final bool shouldRedirect;

  const OnfidoPage({Key? key, required this.shouldRedirect}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (shouldRedirect) {
      // Redirect to HomePage if shouldRedirect is true
      return dl_start_new();
    } else {
      // Return an empty Container if shouldRedirect is false
      return Container();
    }
  }
}