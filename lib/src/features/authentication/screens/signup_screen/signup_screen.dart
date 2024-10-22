import 'package:flutter/material.dart';
import 'package:homescout/src/common_widgets/form/form_header_widget.dart';
import 'package:homescout/src/constants/image_string.dart';
import 'package:homescout/src/constants/sizes.dart';
import 'package:homescout/src/constants/text_string.dart';
import 'package:homescout/src/features/authentication/screens/signup_screen/widget/signup_form_widget.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(hDefaultSize),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FormHeaderWidget(
                    image: hWelcomeScreenImage,
                    title: hSignUpTitle,
                    subTitle: hSignUpSubTitle),
                const SignUpFormWidget(),
                Column(
                  children: [
                    const Text("OR"),
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton.icon(
                        onPressed: () {},
                        icon: Image(
                          image: AssetImage(hGoogleLogo),
                          width: 20.0,
                        ),
                        label: Text(hSignInWithGoogle),
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(text: hAlreadyHaveAnAccount, style: Theme.of(context).textTheme.bodyLarge),
                            TextSpan(text: hLogin),
                          ]
                        )
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
