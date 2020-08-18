import 'package:ecx_learn/utilities/widgets.dart';
import 'package:flutter/material.dart';
import 'package:ecx_learn/utilities/styles.dart' as Style;

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Style.themeWhite,
        leading: Icon(
          Icons.menu,
          color: Colors.black,
        ),
        title: getAppBarTitle(),
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(24, 24, 24, 0),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Style.themeWhite,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
