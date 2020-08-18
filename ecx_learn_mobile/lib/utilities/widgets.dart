import 'package:flutter/material.dart';
import 'package:ecx_learn/utilities/styles.dart' as Style;

getAppBarTitle() {
  return RichText(
    text: TextSpan(
      text: "Ecx",
      style: Style.defaultTextStyle.copyWith(
        fontSize: 24,
        fontWeight: FontWeight.normal,
        color: Colors.black,
      ),
      children: [
        TextSpan(
          text: "Learn",
          style: Style.defaultTextStyle.copyWith(
            fontSize: 24,
            color: Style.themeGreen,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    ),
  );
}
