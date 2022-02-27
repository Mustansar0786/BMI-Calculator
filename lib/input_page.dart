import 'package:bmi_calculator/icon_content.dart';
import 'package:bmi_calculator/reuseable_card.dart';
import 'package:flutter/material.dart';

const bottemContainerHeight = 70.0;
const activeCardColor = Color(0xff1d1e33);
const inactiveCardColor = Color.fromARGB(50, 29, 30, 51);
const battomContainerColor = Color(0xffeb1555);
enum Gender { male, female }

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  updateCard(Gender gender) {
    if (gender == Gender.male) {
      maleCardColor = activeCardColor;
      femaleCardColor = inactiveCardColor;
    } else {
      maleCardColor = inactiveCardColor;
      femaleCardColor = activeCardColor;
    }
  }

  Color maleCardColor = inactiveCardColor;
  Color femaleCardColor = inactiveCardColor;

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
                        updateCard(Gender.male);
                      });
                    },
                    child: ReuseableCard(
                      colour: maleCardColor,
                      cardChild:
                          const IconContent(icon: Icons.male, label: "Male"),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () => setState(() {
                      updateCard(Gender.female);
                    }),
                    child: ReuseableCard(
                        colour: femaleCardColor,
                        cardChild: const IconContent(
                            icon: Icons.female, label: "Female")),
                  ),
                )
              ],
            )),
            const Expanded(
                child: ReuseableCard(
              colour: activeCardColor,
              cardChild: Center(),
            )),
            Expanded(
                child: Row(
              children: const <Widget>[
                Expanded(
                    child: ReuseableCard(
                        colour: activeCardColor, cardChild: Center())),
                Expanded(
                  child: ReuseableCard(
                      colour: activeCardColor, cardChild: Center()),
                )
              ],
            )),
            Container(
                width: double.infinity,
                margin: const EdgeInsets.only(top: 10),
                height: bottemContainerHeight,
                color: battomContainerColor)
          ],
        ));
  }
}
