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

class CustomLongButton extends StatelessWidget {
  const CustomLongButton(
      {Key key, this.onPressed, this.label, this.color, this.labelColor})
      : super(key: key);
  final Function onPressed;
  final String label;
  final Color color;
  final Color labelColor;
  @override
  Widget build(BuildContext context) {
    return InkResponse(
      onTap: onPressed,
      child: Container(
        color: color ?? Style.themeGreen,
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        child: Text(
          label,
          style: Style.buttonTextStyle.copyWith(color: labelColor),
        ),
      ),
    );
  }
}
