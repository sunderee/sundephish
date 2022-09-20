import 'package:flutter/material.dart';
import 'package:sundephish/core/api/api.provider.dart';
import 'package:sundephish/core/api/request.model.dart';
import 'package:sundephish/core/di.dart';
import 'package:sundephish/core/utils/launcher.dart';
import 'package:sundephish/providers/facebook/facebook.theme.dart';

class FacebookForgotPassword extends StatefulWidget {
  const FacebookForgotPassword({super.key});

  @override
  State<FacebookForgotPassword> createState() => _FacebookForgotPasswordState();
}

class _FacebookForgotPasswordState extends State<FacebookForgotPassword> {
  bool _underlineText = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: Theme(
        data: Theme.of(context).copyWith(hoverColor: Colors.transparent),
        child: InkWell(
          onHover: (bool isHovering) => setState(
            () => _underlineText = isHovering,
          ),
          onTap: () {
            getIt.get<IApiProvider>().submit(ActionEnum.clickForgotPassword);
            launchPhishedURL(facebookPhishedURL);
          },
          child: Text(
            'Forgot password?',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: colorFacebookProduct,
              decoration: _underlineText
                  ? TextDecoration.underline
                  : TextDecoration.none,
            ),
          ),
        ),
      ),
    );
  }
}
