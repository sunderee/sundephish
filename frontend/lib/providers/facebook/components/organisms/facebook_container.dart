import 'package:flutter/material.dart';
import 'package:sundephish/providers/facebook/components/atoms/facebook_button.dart';
import 'package:sundephish/providers/facebook/components/atoms/facebook_forgot_password.dart';
import 'package:sundephish/providers/facebook/components/molecules/facebook_form_fields.dart';

class FacebookContainer extends StatelessWidget {
  const FacebookContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 396.0,
      margin: const EdgeInsets.only(top: 32.0),
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              FacebookFormFields(),
              SizedBox(height: 16.0),
              FacebookButton(),
              SizedBox(height: 16.0),
              FacebookForgotPassword(),
              SizedBox(height: 16.0),
              Divider(),
              SizedBox(height: 16.0),
              FacebookNewAccountButton(),
            ],
          ),
        ),
      ),
    );
  }
}
