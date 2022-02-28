import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  const BottomButton({
    Key? key,
    required this.buttonTitle,
    required this.onTap,
  }) : super(key: key);

  final String buttonTitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          padding: const EdgeInsets.only(bottom: 10.0),
          alignment: AlignmentDirectional.center,
          child: Text(
            buttonTitle,
            style: kLargeButtonTextStyle,
          ),
          width: double.infinity,
          margin: const EdgeInsets.only(top: 10),
          height: kBottemContainerHeight,
          color: kBattomContainerColor),
    );
  }
}
