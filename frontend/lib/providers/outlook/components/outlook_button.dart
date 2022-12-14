import 'package:flutter/material.dart';
import 'package:sundephish/providers/outlook/outlook.theme.dart';

class OutlookButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const OutlookButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: colorOutlookProduct,
      onPressed: onPressed,
      child: Text(
        text,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
