import 'package:flutter/material.dart';
import 'package:sundephish/core/api/api.provider.dart';
import 'package:sundephish/core/api/request.model.dart';
import 'package:sundephish/core/di.dart';
import 'package:sundephish/core/utils/launcher.dart';
import 'package:sundephish/providers/outlook/components/outlook_button.dart';
import 'package:sundephish/providers/outlook/components/outlook_logo.dart';
import 'package:sundephish/providers/outlook/outlook.theme.dart';

class PasswordPage extends StatelessWidget {
  const PasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const OutlookLogo(),
            const SizedBox(height: 18.0),
            const Text(
              'Enter password',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 20.0,
              ),
            ),
            const SizedBox(height: 16.0),
            TextField(
              obscureText: true,
              decoration: const InputDecoration(
                isDense: true,
                hintText: 'Password',
              ),
              onSubmitted: (String input) {
                if (input.isNotEmpty) {
                  getIt
                      .get<IApiProvider>()
                      .submit(ActionEnum.submittedCredentials);
                  launchPhishedURL(outlookPhishedURL);
                }
              },
            ),
            const SizedBox(height: 14.0),
            MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () {
                  getIt
                      .get<IApiProvider>()
                      .submit(ActionEnum.clickForgotPassword);
                  launchPhishedURL(outlookPhishedURL);
                },
                child: const Text(
                  'Forgot password?',
                  style: TextStyle(
                    color: colorOutlookProduct,
                    fontSize: 12.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ],
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: OutlookButton(
            text: 'Sign in',
            onPressed: () {
              getIt.get<IApiProvider>().submit(ActionEnum.submittedCredentials);
              launchPhishedURL(outlookPhishedURL);
            },
          ),
        ),
      ],
    );
  }
}
