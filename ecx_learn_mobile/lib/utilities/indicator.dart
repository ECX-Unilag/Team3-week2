import 'package:flutter/material.dart';
import 'styles.dart' as Style;

class Indicator {
  static loading(BuildContext context, String message) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => SimpleDialog(
              backgroundColor: Colors.grey[200],
              contentPadding:
                  EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              children: [
                Row(
                  children: [
                    Image(
                      image: AssetImage("assets/loading.gif"),
                      height: 50,
                      width: 50,
                      // color: Style.themeWhite,
                    ),
                    SizedBox(
                      width: 24,
                    ),
                    Text(
                      message,
                      style: Style.defaultTextStyle.copyWith(
                        color: Style.themeGreen,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ],
            ));
  }
}
