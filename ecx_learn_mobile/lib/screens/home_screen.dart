import 'package:ecx_learn/api/api.dart';
import 'package:ecx_learn/utilities/indicator.dart';
import 'package:ecx_learn/utilities/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ecx_learn/utilities/styles.dart' as Style;

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int numberOfQuestions = 10;
  getSectionTitle(String text) {
    return Text(
      text,
      style: Style.defaultTextStyle.copyWith(
        fontSize: 17,
        fontWeight: FontWeight.w500,
        color: Colors.white,
      ),
    );
  }

  List<String> difficultyList = ["Easy", "Medium", "Hard"];
  String difficulty = "Easy";
  List<DropdownMenuItem> getDifficultyDropdown() {
    List<DropdownMenuItem> allDropDowns = [];
    for (String difficulty in difficultyList) {
      DropdownMenuItem dropdownMenuItem = DropdownMenuItem(
        value: difficulty,
        child: Text(
          difficulty,
          style: Style.defaultTextStyle.copyWith(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
      );
      allDropDowns.add(dropdownMenuItem);
    }
    return allDropDowns;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Style.themeGreen,
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 90,
              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              decoration: BoxDecoration(
                color: Style.themeWhite,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ScoreColumn(),
                  VerticalDivider(),
                  ScoreColumn(),
                ],
              ),
            ),
            SizedBox(
              height: 24,
            ),
            getSectionTitle("Number of questions:"),
            SizedBox(
              height: 8,
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 14, horizontal: 16),
              color: Style.themeWhite,
              child: Row(
                children: [
                  Text(
                    "$numberOfQuestions",
                    style: Style.defaultTextStyle
                        .copyWith(color: Style.themeGreen, fontSize: 20),
                  ),
                  Spacer(),
                  SmallRoundButton(
                    icon: Icons.add,
                    color: Style.themeGreen,
                    onPressed: () {
                      setState(() {
                        if (numberOfQuestions != 50) {
                          numberOfQuestions++;
                        }
                      });
                    },
                  ),
                  SmallRoundButton(
                    icon: Icons.remove,
                    color: Color(0xFFFF0000),
                    onPressed: () {
                      setState(() {
                        if (numberOfQuestions != 0) {
                          numberOfQuestions--;
                        }
                      });
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 24,
            ),
            getSectionTitle("Select difficulty"),
            SizedBox(
              height: 8,
            ),
            DropdownButton(
              dropdownColor: Style.themeGreen,
              iconEnabledColor: Style.themeWhite,
              isExpanded: true,
              value: difficulty,
              items: getDifficultyDropdown(),
              onChanged: (value) {
                setState(() {
                  difficulty = value;
                });
              },
            ),
            Spacer(),
            CustomLongButton(
              label: "Start quiz",
              onPressed: () async {
                Indicator.loading(context, "Loading Questions");
                List questions =
                    await Api().getQuizQuestions(difficulty, numberOfQuestions);
                print(questions);
                Navigator.pop(context);
              },
              color: Style.themeWhite,
              labelColor: Style.themeGreen,
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}

class SmallRoundButton extends StatelessWidget {
  const SmallRoundButton({Key key, this.icon, this.color, this.onPressed})
      : super(key: key);
  final IconData icon;
  final Color color;
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return InkResponse(
      onTap: onPressed,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 4),
        padding: EdgeInsets.all(2),
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          color: Style.themeWhite,
        ),
      ),
    );
  }
}

class ScoreColumn extends StatelessWidget {
  const ScoreColumn({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Last quiz score",
          style: Style.defaultTextStyle.copyWith(
            fontWeight: FontWeight.normal,
            fontSize: 15,
            color: Colors.black,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          "200",
          style: Style.defaultTextStyle.copyWith(
            color: Style.themeGreen,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
