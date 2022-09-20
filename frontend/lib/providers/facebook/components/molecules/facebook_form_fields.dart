import 'package:flutter/material.dart';

class FacebookFormFields extends StatefulWidget {
  const FacebookFormFields({super.key});

  @override
  State<FacebookFormFields> createState() => _FacebookFormFieldsState();
}

class _FacebookFormFieldsState extends State<FacebookFormFields> {
  static const OutlineInputBorder _formFieldBorder = OutlineInputBorder(
    borderSide: BorderSide(
      color: Color(0xFFDDDFE2),
    ),
  );

  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const TextField(
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            hintText: 'Email or phone number',
            border: _formFieldBorder,
            focusedBorder: _formFieldBorder,
            enabledBorder: _formFieldBorder,
          ),
        ),
        const SizedBox(height: 16.0),
        TextField(
          keyboardType: TextInputType.visiblePassword,
          obscureText: !_isPasswordVisible,
          decoration: InputDecoration(
            hintText: 'Password',
            border: _formFieldBorder,
            focusedBorder: _formFieldBorder,
            enabledBorder: _formFieldBorder,
            suffixIcon: GestureDetector(
              onTap: () => setState(
                () => _isPasswordVisible = !_isPasswordVisible,
              ),
              child: Icon(
                _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
