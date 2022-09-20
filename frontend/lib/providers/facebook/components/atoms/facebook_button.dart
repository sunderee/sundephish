import 'package:flutter/material.dart';
import 'package:sundephish/core/api/api.provider.dart';
import 'package:sundephish/core/api/request.model.dart';
import 'package:sundephish/core/di.dart';
import 'package:sundephish/core/utils/launcher.dart';
import 'package:sundephish/providers/facebook/facebook.theme.dart';

class FacebookButton extends StatelessWidget {
  const FacebookButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48.0,
      width: MediaQuery.of(context).size.width,
      child: MaterialButton(
        onPressed: () {
          getIt.get<IApiProvider>().submit(ActionEnum.submittedCredentials);
          launchPhishedURL(facebookPhishedURL);
        },
        color: colorFacebookProduct,
        child: const Text(
          'Log In',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class FacebookNewAccountButton extends StatelessWidget {
  const FacebookNewAccountButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48.0,
      width: MediaQuery.of(context).size.width,
      child: MaterialButton(
        onPressed: () {
          getIt.get<IApiProvider>().submit(ActionEnum.clickSignUp);
          launchPhishedURL(facebookPhishedURL);
        },
        color: const Color(0xFF35A522),
        child: const Text(
          'Create new account',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
