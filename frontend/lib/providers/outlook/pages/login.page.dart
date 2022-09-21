import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:sundephish/core/api/api.provider.dart';
import 'package:sundephish/core/api/request.model.dart';
import 'package:sundephish/core/di.dart';
import 'package:sundephish/core/utils/launcher.dart';
import 'package:sundephish/providers/outlook/components/outlook_button.dart';
import 'package:sundephish/providers/outlook/components/outlook_logo.dart';
import 'package:sundephish/providers/outlook/outlook.theme.dart';

class LoginPage extends StatelessWidget {
  final VoidCallback onNextPage;

  const LoginPage({
    super.key,
    required this.onNextPage,
  });

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
              'Sign in',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 20.0,
              ),
            ),
            const SizedBox(height: 16.0),
            TextField(
              decoration: const InputDecoration(
                isDense: true,
                hintText: 'Email, phone, or Skype',
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
            const SizedBox(height: 16.0),
            RichText(
              text: TextSpan(
                text: 'No account? ',
                style: const TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.w400,
                ),
                children: [
                  TextSpan(
                    text: 'Create one!',
                    style: const TextStyle(color: colorOutlookProduct),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        getIt
                            .get<IApiProvider>()
                            .submit(ActionEnum.clickSignUp);
                        launchPhishedURL(outlookPhishedURL);
                      },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 64.0),
          ],
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: OutlookButton(onPressed: onNextPage),
        ),
      ],
    );
  }
}
