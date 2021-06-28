import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/reusablecard.dart';
import '../components/icon_content.dart';
import '../constants.dart';
import 'result_page.dart';
import '../components/bottom_button.dart';
import '../components/round_icon.dart';
import 'package:bmi_calculator/calculate_brain.dart';
enum Gender{
  male,
  female
}
class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}


class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height=180;
  int age=19;
  int weight=60;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
           child: Row(
             children: <Widget>[
               Expanded(
                 child: Reusablecard(colour: selectedGender==Gender.male ? kActiveCardColour : kInactiveCardColor,
                 onPress: (){
                   setState(() {
                     selectedGender=Gender.male;
                   });
                 },
                 cardChild: IconContent(
                   icon: FontAwesomeIcons.mars,
                   label: 'MALE',
                 ),
                 ),
               ),
               Expanded(
                 child: Reusablecard(colour: selectedGender==Gender.female ? kActiveCardColour : kInactiveCardColor,
                   onPress: (){
                   setState(() {
                     selectedGender=Gender.female;
                   });
                   },
                   cardChild: IconContent(
                     icon: FontAwesomeIcons.venus,
                     label: 'FEMALE',
                   ),
                 ),

               ),
             ],
           ),
          ),
          Expanded(
    child: Reusablecard(
              colour: kActiveCardColour,

              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('HEIGHT',
                  style:kLabelTextStyle),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        height.toString(),
                        style: kNumberStyle,
                      ),
                      Text(
                        ' cm',
                        style: kLabelTextStyle,

                      )
                    ],
                  ),
                  SliderTheme(
                    data:SliderTheme.of(context).copyWith(
                      inactiveTrackColor: Color(0xFF8D8E98),
                      activeTrackColor: Colors.white,
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
                      thumbColor: Color(0xFFEB1555),
                      overlayColor: Color(0x29EB1555)
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 100.0,
                      max:320.0,
                       onChanged: (double newValue) {

                        setState(() {
                          height=newValue.round();
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
                  child: Reusablecard(colour: kActiveCardColour,
                  cardChild:Column(
                       mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('WEIGHT',
                      style: kLabelTextStyle),
                      Text(
                        weight.toString(),
                        style: kNumberStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                         RoundIconButton(
                           icon:FontAwesomeIcons.minus,
                           onPressed: (){
                             setState(() {
                               weight--;
                             });
                           },

                         ),
                          SizedBox(
                            width: 10.0,
                          ),
                          RoundIconButton(
                            icon:FontAwesomeIcons.plus,
                            onPressed: (){
                              setState(() {
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

                  child: Reusablecard(

                      colour:kActiveCardColour,
                    cardChild:Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('AGE',
                            style: kLabelTextStyle),
                        Text(
                          age.toString(),
                          style: kNumberStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              icon:FontAwesomeIcons.minus,
                              onPressed: (){
                                setState(() {
                                  age--;
                                });
                              },

                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              icon:FontAwesomeIcons.plus,
                              onPressed: (){
                                setState(() {
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
            buttonTitle: 'CALCULATE',
          onTap: () {
              CalculateBrain calc =CalculateBrain(height: height, weight: weight);

            Navigator.push(context, MaterialPageRoute(builder: (context)=> ResultPage(
              bmiResult: calc.calculateBMI(),
              resultText: calc.getResult(),
              interpretation: calc.getInterpretation(),
            )));
          },
          ),
        ],
      )


    );
  }
}







