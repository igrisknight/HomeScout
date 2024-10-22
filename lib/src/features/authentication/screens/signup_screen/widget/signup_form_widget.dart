import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homescout/src/constants/sizes.dart';
import 'package:homescout/src/constants/text_string.dart';
import 'package:homescout/src/features/authentication/controllers/signup_controller.dart';


class SignUpFormWidget extends StatelessWidget {
  const SignUpFormWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    final _formkey = GlobalKey<FormState>();
    return Container(
      padding: const EdgeInsets.symmetric(vertical: hFormHeight),
      child: Form(
        key: _formkey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: controller.fullname,
              decoration: const InputDecoration(
                label: Text(hFullName),
                prefixIcon: Icon(Icons.person_outline_outlined),
              ),
            ),
            const SizedBox(
              height: hFormHeight - 20,
            ),
            TextFormField(
              controller: controller.email,
              decoration: const InputDecoration(
                label: Text(hEmail),
                prefixIcon: Icon(Icons.email_outlined),
              ),
            ),
            const SizedBox(
              height: hFormHeight - 20,
            ),
            TextFormField(
              controller: controller.phoneNo,
              decoration: const InputDecoration(
                label: Text(hPhoneNo),
                prefixIcon: Icon(Icons.call_outlined),
              ),
            ),
            const SizedBox(
              height: hFormHeight - 20,
            ),
            TextFormField(
              controller: controller.password,
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
                onPressed: () {
                  if(_formkey.currentState!.validate()){
                    SignUpController.instance.registerUser(controller.email.text.trim(), controller.password.text.trim());
                  }
                },
                child: Text(hSignup.toUpperCase()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
