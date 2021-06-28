import 'package:bmi_calculator/ad_manager.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../components/reusablecard.dart';
import 'package:bmi_calculator/components/bottom_button.dart';

class ResultPage extends StatelessWidget {

  ResultPage({@required this.bmiResult,@required this.interpretation,@required this.resultText});

  final String bmiResult;
  final String resultText;
  final String interpretation;



  @override
  Widget build(BuildContext context) {


    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[



            Expanded(
              child: Container(
                padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.001),
                alignment: Alignment.bottomCenter,
                child: Text('Your Result',
                  style: kTitleTextStyle,
                ),

              ),
            ),
            Expanded(
              flex: 5,
              child: Reusablecard(
                colour: kActiveCardColour,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(resultText.toUpperCase(),
                        style:kResultTextStyle
                    ),
                    Text(
                      bmiResult,
                      style: kBMITextstyle,
                    ),
                    Text(interpretation,
                      style: kBodyTextStyle,
                      textAlign: TextAlign.center,),

                  ],
                ),
              ),
            ),
            BottomButton(buttonTitle: 'RE-CALCULATE',
              onTap: (){
                Navigator.pop(context);
              },),

          ],
        ),
      ),
    );
  }



}

