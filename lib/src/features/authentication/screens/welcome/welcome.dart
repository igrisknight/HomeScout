import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homescout/src/common_widgets/fade_in_animation/animation_design.dart';
import 'package:homescout/src/common_widgets/fade_in_animation/fade_in_animation_controller.dart';
import 'package:homescout/src/common_widgets/fade_in_animation/fade_in_animation_model.dart';
import 'package:homescout/src/constants/colors.dart';
import 'package:homescout/src/constants/image_string.dart';
import 'package:homescout/src/constants/sizes.dart';
import 'package:homescout/src/constants/text_string.dart';
import 'package:homescout/src/features/authentication/screens/login/login_screen.dart';


class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FadeInAnimationController());
    controller.startAnimation();

    var mediaQuery = MediaQuery.of(context);
    var brightness = mediaQuery.platformBrightness;
    var height = mediaQuery.size.height;
    final isDark =  brightness == Brightness.dark;

    return Scaffold(
        backgroundColor: isDark ? hSecondaryColor : hPrimaryColor,
        body: Stack(
          children: [
            HFadeInAnimation(
              durationInMs: 1200,
              animate: HAnimatePosition(bottomAfter: 0, bottomBefore: -100, leftBefore: 0, leftAfter: 0, topAfter: 0, topBefore: 0, rightAfter: 0, rightBefore: 0),
              child: Container(
                 padding: EdgeInsets.all(hDefaultSize),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image(
                        image: AssetImage(hWelcomeScreenImage), //change this image.//
                        height: height * 0.6,
                      ),
                  Column(
                    children: [
                        Text(
                        hWelcomePageTitle,
                        style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        Text(
                          hWelcomePageSubTitle,
                          style: Theme.of(context).textTheme.headlineSmall,
                          textAlign: TextAlign.center,
                    ),
                  ],
                ),
                    Row(
                      children: [
                        Expanded(
                          child: OutlinedButton(
                            onPressed: () => Get.to(const LoginScreen()),
                            child: Text(hLogin.toUpperCase()))),
                        const SizedBox(
                          width: 10.0,
                        ),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {},
                            child: Text(hSignup.toUpperCase()))),
                      ],
                    )
                  ],
                    ),
                  ),
            ),
          ],
        ));
  }
}
