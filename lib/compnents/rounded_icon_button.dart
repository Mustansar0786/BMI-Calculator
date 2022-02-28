import 'package:flutter/material.dart';

class RoundedIconButton extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const RoundedIconButton({
    required this.icon,
    required this.onPressed,
  });

  final IconData icon;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      shape: const CircleBorder(),
      child: Icon(icon),
      fillColor: const Color(0xff4c4f5e),
      constraints: const BoxConstraints(minHeight: 56, minWidth: 56),
    );
  }
}
