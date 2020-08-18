import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ecx_learn/utilities/styles.dart' as Style;

import 'home_screen.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(24, 40, 24, 0),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/backgroundImage.png"),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Spacer(
              flex: 3,
            ),
            Text(
              "WELCOME TO \nECX-LEARN",
              style: Style.defaultTextStyle.copyWith(
                color: Style.themeWhite,
                fontWeight: FontWeight.bold,
              ),
            ),
            Spacer(),
            RichText(
              text: TextSpan(
                  text: "TEST YOUR SKILLS ON \nWHAT YOU",
                  style: Style.defaultTextStyle.copyWith(
                    color: Style.themeWhite,
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                  children: [
                    TextSpan(
                      text: " LOVE",
                      style: Style.defaultTextStyle.copyWith(
                        color: Style.themeGreen,
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
                  ]),
            ),
            SizedBox(
              height: 24,
            ),
            InkResponse(
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => HomeScreen(),
                    ));
              },
              child: Container(
                color: Style.themeGreen,
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                child: Text(
                  "Get started",
                  style: Style.buttonTextStyle,
                ),
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
