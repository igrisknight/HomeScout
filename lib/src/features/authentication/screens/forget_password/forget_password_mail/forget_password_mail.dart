import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homescout/src/common_widgets/form/form_header_widget.dart';
import 'package:homescout/src/constants/image_string.dart';
import 'package:homescout/src/constants/sizes.dart';
import 'package:homescout/src/constants/text_string.dart';
import 'package:homescout/src/features/authentication/screens/forget_password/forget_password_otp/otp_screen.dart';

class ForgetPasswordMailScreen extends StatelessWidget {
  const ForgetPasswordMailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(hDefaultSize),
          child: Column(
            children: [
              const SizedBox(height: hDefaultSize * 4),
              const FormHeaderWidget(
                image: hForgetPasswordImage,
                title: hForgetPassword,
                subTitle: hForgetMailSubTitle,
                crossAxisAlignment: CrossAxisAlignment.center,
                heightBetween: 30.0,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: hFormHeight,
              ),
              Form(
                  child: Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      label: Text(hEmail),
                      hintText: hEmail,
                      prefixIcon: Icon(Icons.mail_outline_rounded),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () {
                            Get.to(() => const OtpScreen());
                          },
                          child: const Text(hNext))),
                ],
              ))
            ],
          ),
        ),
      )),
    );
  }
}
