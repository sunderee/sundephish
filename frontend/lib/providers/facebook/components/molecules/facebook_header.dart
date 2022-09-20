import 'package:flutter/material.dart';
import 'package:sundephish/providers/facebook/components/atoms/facebook_logo.dart';

class FacebookHeader extends StatelessWidget {
  const FacebookHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400.0,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: const [
          FacebookLogo(),
          Text(
            'Connect with friends and the world around you on Facebook :)',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFF2C2E24),
              fontSize: 24.0,
            ),
          ),
        ],
      ),
    );
  }
}
