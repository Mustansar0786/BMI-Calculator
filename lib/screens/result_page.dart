import 'package:bmi_calculator/compnents/bottom_button.dart';
import 'package:bmi_calculator/compnents/reuseable_card.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

class Results extends StatelessWidget {
  const Results(
      {Key? key,
      required this.resultText,
      required this.resultNo,
      required this.interpretatin})
      : super(key: key);

  final String resultText;
  final String resultNo;
  final String interpretatin;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    "Your Result",
                    style: kNumberTextStyle.copyWith(
                        fontWeight: FontWeight.bold, fontSize: 40),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: ReuseableCard(
                  colour: kActiveCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        resultText.toUpperCase(),
                        style: const TextStyle(
                            color: Colors.greenAccent,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(resultNo,
                          style: kNumberTextStyle.copyWith(fontSize: 100)),
                      Text(interpretatin,
                          textAlign: TextAlign.center,
                          style: kNumberTextStyle.copyWith(
                              fontSize: 20, fontWeight: FontWeight.w100)),
                    ],
                  )),
            ),
            Expanded(
              child: BottomButton(
                  buttonTitle: "Re-Calculate",
                  onTap: () {
                    Navigator.pop(context);
                  }),
            )
          ],
        ),
      ),
    );
  }
}
