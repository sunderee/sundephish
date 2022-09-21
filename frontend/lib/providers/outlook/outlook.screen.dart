import 'package:flutter/material.dart';
import 'package:sundephish/providers/outlook/pages/login.page.dart';

class OutlookScreen extends StatefulWidget {
  const OutlookScreen({super.key});

  @override
  State<OutlookScreen> createState() => _OutlookScreenState();
}

class _OutlookScreenState extends State<OutlookScreen> {
  final _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: 328.0,
          width: 440.0,
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: PageView(
                controller: _pageController,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  LoginPage(
                    onNextPage: () {},
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
