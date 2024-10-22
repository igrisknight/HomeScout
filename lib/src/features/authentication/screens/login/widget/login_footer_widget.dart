import 'package:flutter/material.dart';
import 'package:homescout/src/constants/image_string.dart';
import 'package:homescout/src/constants/sizes.dart';
import 'package:homescout/src/constants/text_string.dart';

class LoginFooterWidget extends StatelessWidget {
  const LoginFooterWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text("OR"),
        SizedBox(height: hFormHeight - 20),
        SizedBox(
            width: double.infinity,
            child: OutlinedButton.icon(
                icon: Image(
                  image: AssetImage(hGoogleLogo),
                  width: 20.0,
                ),
                onPressed: () {},
                label: Text(hSignInWithGoogle))),
        SizedBox(height: hFormHeight - 20),
        TextButton(
            onPressed: () {},
            child: Text.rich(TextSpan(
                text: hDontHaveAnAccount,
                style: Theme.of(context).textTheme.bodyLarge,
                children: const [
                  TextSpan(
                    text: hSignup,
                    style: TextStyle(color: Colors.blue),
                  )
                ])))
      ],
    );
  }
}
