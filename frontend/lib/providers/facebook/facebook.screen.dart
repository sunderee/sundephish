import 'package:flutter/material.dart';
import 'package:sundephish/providers/facebook/components/molecules/facebook_header.dart';
import 'package:sundephish/providers/facebook/components/organisms/facebook_container.dart';

class FacebookScreen extends StatelessWidget {
  const FacebookScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            FacebookHeader(),
            FacebookContainer(),
          ],
        ),
      ),
    );
  }
}
