import 'package:flutter/material.dart';
import 'package:sundephish/providers/outlook/outlook.theme.dart';

class OutlookButton extends StatelessWidget {
  final VoidCallback onPressed;

  const OutlookButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: colorOutlookProduct,
      onPressed: onPressed,
      child: const Text(
        'Next',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
