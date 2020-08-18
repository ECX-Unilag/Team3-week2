import 'package:ecx_learn/screens/welcome_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(EcxLearn());
}

class EcxLearn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WelcomeScreen(),
    );
  }
}
