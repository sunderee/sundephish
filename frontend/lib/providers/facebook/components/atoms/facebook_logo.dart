import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sundephish/providers/facebook/facebook.theme.dart';

class FacebookLogo extends StatelessWidget {
  static const String _logoURL =
      'https://static.xx.fbcdn.net/rsrc.php/y8/r/dF5SId3UHWd.svg';

  const FacebookLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.network(
      _logoURL,
      color: colorFacebookProduct,
      height: 106.0,
    );
  }
}
