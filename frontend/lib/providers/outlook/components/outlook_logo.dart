import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class OutlookLogo extends StatelessWidget {
  static const String _logoURL =
      'https://logincdn.msauth.net/shared/1.0/content/images/microsoft_logo_ee5c8d9fb6248c938fd0dc19370e90bd.svg';

  const OutlookLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.network(_logoURL);
  }
}
