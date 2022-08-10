import 'package:bmi_calculator/bottom_button.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/reusable_card.dart';
import 'package:flutter/material.dart';

class ResultsPage extends StatelessWidget {
  ResultsPage({required this.resultBMI,required this.resultComment,required this.resultOverView});
  final String resultBMI;
  final String resultOverView;
  final String resultComment;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BMI Calculator',
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 15),
              alignment: Alignment.bottomLeft,
              child: Text(
                  'Your Result',
                style: kResultStyle,
              ),
            ),
            Expanded(
              flex: 5,
              child: ReusableCard(rang: kActiveColor,
                cardChild: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Center(
                      child: Text(
                        resultComment.toUpperCase(),
                        style: kGreenResultStyle,
                      ),
                    ),
                    Center(
                      child: Text(
                        resultBMI,
                        style: kBMIValueStyle,
                      ),
                    ),
                    Text(
                      resultOverView,
                      style: kCommentStyle,
                    ),
                  ],
                ),
              ),
            ),
            BottomButton(onTap: (){
              Navigator.pop(context);
            }, bottomText: 'RE-CALCULATE'),
          ],
        ),
      ),
    );
  }
}
