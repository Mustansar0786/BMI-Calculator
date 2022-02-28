import 'package:bmi_calculator/calculator_brain.dart';
import 'package:bmi_calculator/compnents/icon_content.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../compnents/bottom_button.dart';
import '../compnents/reuseable_card.dart';
import '../compnents/rounded_icon_button.dart';
import '../constants.dart';
import 'result_page.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender = Gender.male;
  int height = 182;
  int wieght = 60;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("BMI Calculator"),
      ),
      body: Column(
        children: [
          Expanded(
              child: Row(
            children: <Widget>[
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedGender = Gender.male;
                    });
                  },
                  child: ReuseableCard(
                    colour: selectedGender == Gender.male
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardChild:
                        const IconContent(icon: Icons.male, label: "Male"),
                  ),
                ),
              ),
              Expanded(
                child: ReuseableCard(
                    onPress: () => setState(() {
                          selectedGender = Gender.female;
                        }),
                    colour: selectedGender == Gender.female
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardChild:
                        const IconContent(icon: Icons.female, label: "Female")),
              ),
            ],
          )),
          Expanded(
              child: ReuseableCard(
            colour: kActiveCardColor,
            cardChild:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Text("Height", style: kLabelTextStyle),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text(height.toString(), style: kNumberTextStyle),
                  const Text(
                    "cm",
                    style: kLabelTextStyle,
                  )
                ],
              ),
              SliderTheme(
                data: SliderTheme.of(context).copyWith(
                    trackHeight: 2,
                    activeTrackColor: Colors.white,
                    inactiveTrackColor: Colors.grey,
                    thumbColor: kBattomContainerColor,
                    overlayColor: const Color(0x1feb1555)),
                child: Slider(
                    min: 120,
                    max: 220,
                    value: height.toDouble(),
                    onChanged: (double newValue) {
                      setState(() {
                        height = newValue.round();
                      });
                    }),
              )
            ]),
          )),
          Expanded(
              child: Row(
            children: <Widget>[
              Expanded(
                child: ReuseableCard(
                    colour: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Weight", style: kLabelTextStyle),
                        Text(
                          wieght.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundedIconButton(
                              onPressed: () {
                                setState(() {
                                  wieght--;
                                });
                              },
                              icon: CupertinoIcons.minus,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            RoundedIconButton(
                              onPressed: () {
                                setState(() {
                                  wieght++;
                                });
                              },
                              icon: CupertinoIcons.add,
                            )
                          ],
                        )
                      ],
                    )),
              ),
              Expanded(
                child: ReuseableCard(
                    colour: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Age", style: kLabelTextStyle),
                        Text(
                          age.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundedIconButton(
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                              icon: CupertinoIcons.minus,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            RoundedIconButton(
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                              icon: CupertinoIcons.add,
                            )
                          ],
                        )
                      ],
                    )),
              )
            ],
          )),
          BottomButton(
            buttonTitle: "Calculate",
            onTap: () {
              CalculatorBrain cal = CalculatorBrain(height, wieght);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Results(
                            interpretatin: cal.bmiInterpretation(),
                            resultNo: cal.bmiNo(),
                            resultText: cal.bmiText(),
                          )));
            },
          )
        ],
      ),
    );
  }
}
