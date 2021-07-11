import 'dart:math';

import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/reuseable_card.dart';
import 'package:flutter/material.dart';

class CalculatorBrain{
  CalculatorBrain(this.height, this.weight);
  double _bmi;
  final int height;
  final int weight;
  String calcBmi(){
    _bmi=weight/pow(height/100, 2);
    return _bmi.toStringAsFixed(1);
  }
  String remark(){
    if(_bmi>=25)
      return 'Overweight';
    else if(_bmi>18.5)
      return 'Normal';
    else
      return 'Underweight';
  }
  String motivation(){
    if(_bmi>=25)
      return 'You have higher tha normal body weight. You should exercise more.';
    else if(_bmi>18.5)
      return 'You have normal body weight. Good job!';
    else
      return 'You have lower than normal body weight. You should eat more.';
  }

}

class Result extends StatelessWidget {
  Result({@required this.bmi,@required this.motivation,@required this.result});
  final String bmi;
  final String motivation;
  final String result;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Your Result',
            style:
            TextStyle(fontWeight: FontWeight.bold, fontSize: 40 ),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: ReuseableCard(
                colour: activeCardColor,
                cardChild: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 80,horizontal: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(result,style: TextStyle(color: Colors.greenAccent, fontSize: 25),textAlign: TextAlign.center,),
                      Text(bmi,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 90 ),textAlign: TextAlign.center,),
                      Text(motivation, style: TextStyle(fontSize: 15
                      ),textAlign: TextAlign.center,)
                    ],
                  ),
                ),
              ),
            ),
            Container(
              color: Color(0xFFEB1555),
              height: 60,
              child: GestureDetector(
                onTap: (){
                  Navigator.pop(context);
                },
                child: Center(
                    child: Text(
                      "RE-CALCULATE",
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.w200),
                    )),
              ),
            )
          ],
        ));
  }
}
