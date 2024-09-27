import 'package:flutter/material.dart';
import 'package:homescout/src/constants/sizes.dart';
import 'package:homescout/src/constants/text_string.dart';


class SignUpFormWidget extends StatelessWidget {
  const SignUpFormWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: hFormHeight),
      child: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              decoration: const InputDecoration(
                label: Text(hFullName),
                prefixIcon: Icon(Icons.person_outline_outlined),
              ),
            ),
            const SizedBox(
              height: hFormHeight - 20,
            ),
            TextFormField(
              decoration: const InputDecoration(
                label: Text(hEmail),
                prefixIcon: Icon(Icons.email_outlined),
              ),
            ),
            const SizedBox(
              height: hFormHeight - 20,
            ),
            TextFormField(
              decoration: const InputDecoration(
                label: Text(hPhoneNo),
                prefixIcon: Icon(Icons.call_outlined),
              ),
            ),
            const SizedBox(
              height: hFormHeight - 20,
            ),
            TextFormField(
              decoration: const InputDecoration(
                label: Text(hPassword),
                prefixIcon: Icon(Icons.fingerprint_outlined),
              ),
            ),
            const SizedBox(
              height: hFormHeight - 20,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                child: Text(hSignup.toUpperCase()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
