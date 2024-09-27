import 'package:flutter/material.dart';
import 'package:homescout/src/constants/image_string.dart';
import 'package:homescout/src/constants/sizes.dart';
import 'package:homescout/src/constants/text_string.dart';
import 'package:homescout/src/features/authentication/screens/login/widget/login_footer_widget.dart';
import 'package:homescout/src/features/authentication/screens/login/widget/login_form_widget.dart';
import 'package:homescout/src/features/authentication/screens/login/widget/login_header_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(hDefaultSize),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    LoginHeaderWidget(size: size),
                    const LoginForm(),
                    const LoginFooterWidget()
                  ],
                ),
              ))),
    );
  }
}
