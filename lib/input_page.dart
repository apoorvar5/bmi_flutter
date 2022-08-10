import 'package:bmi_calculator/result.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/reusable_card.dart';
import 'gender_widget.dart';
import 'package:bmi_calculator/round_icon_widget.dart';
import 'package:bmi_calculator/constants.dart';
import 'bottom_button.dart';
import 'package:bmi_calculator/calculator_brain.dart';

enum GenderType{
  male,
  female
}

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  int height=180;
  int age=20;
  int weight=70;
  GenderType?selectedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BMI CALCULATOR',
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    onPress: (){
                      setState((){
                        selectedGender=GenderType.male;
                      });
                    },
                    rang: selectedGender==GenderType.male?kActiveColor:kInactiveColor,
                    cardChild: GenderWidget(genderIcon: Icons.male_sharp, genderText: 'MALE',),),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress:(){
                      setState((){
                        selectedGender=GenderType.female;
                      });
                    },
                    rang: selectedGender==GenderType.female?kActiveColor:kInactiveColor,
                    cardChild: GenderWidget(genderIcon: Icons.female_sharp, genderText: 'FEMALE',),),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              rang: kActiveColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                      'HEIGHT',
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                          height.toString(),
                        style: kValuesStyle,
                      ),
                      Text(
                          'cm',
                        style: kLabelTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: Color(0xFF8D8E98),
                      overlayColor: Color(0x1fEB1555),
                      thumbColor: kBottomContainerColor,
                      overlayShape: RoundSliderOverlayShape(
                        overlayRadius: 30,
                      ),
                      thumbShape: RoundSliderThumbShape(
                        enabledThumbRadius: 16,
                      ),
                    ),
                    child: Slider(
                        value: height.toDouble(),
                        min: 120,
                        max: 220,
                        onChanged: (double newValue){
                          setState((){
                            height=newValue.toInt();
                          });
                        },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                      rang: kActiveColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'WEIGHT',
                          style: kLabelTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                                weight.toString(),
                              style: kValuesStyle,
                            ),
                            Text(
                              'kg',
                              style: kLabelTextStyle,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconWidget(icon: '-',
                            onState: (){
                              setState((){
                                weight--;
                              });
                            },
                            ),
                            SizedBox(width: 10,),
                            RoundIconWidget(icon: '+',
                              onState: (){
                                setState((){
                                  weight++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    rang: kActiveColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'AGE',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kValuesStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconWidget(icon:'-' ,
                              onState: (){
                                setState((){
                                  age--;
                                });
                              },
                              longPress: (){
                                setState((){
                                  age--;
                                });
                              },
                            ),
                            SizedBox(width: 10,),
                            RoundIconWidget(icon: '+',
                              onState: (){
                                setState((){
                                  age++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            onTap:(){
              CalculatorBrain calc=CalculatorBrain(height: height,weight: weight);
              Navigator.push(context, MaterialPageRoute(builder: (context)=>ResultsPage(
                  resultBMI: calc.getBMI(),
                  resultComment: calc.getComments(),
                  resultOverView: calc.getOverView())
              ),
              );
              },
            bottomText: 'CALCULATE',),
        ],
      ),
    );
  }
}