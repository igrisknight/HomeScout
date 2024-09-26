import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homescout/src/common_widgets/fade_in_animation/animation_design.dart';
import 'package:homescout/src/common_widgets/fade_in_animation/fade_in_animation_controller.dart';
import 'package:homescout/src/common_widgets/fade_in_animation/fade_in_animation_model.dart';
import 'package:homescout/src/constants/colors.dart';
import 'package:homescout/src/constants/image_string.dart';
import 'package:homescout/src/constants/sizes.dart';
import 'package:homescout/src/constants/text_string.dart';


class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});



  @override
  Widget build(BuildContext context) {
    final controller =  Get.put(FadeInAnimationController());
    controller.startSplashAnimation();

    var mediaQuery = MediaQuery.of(context);
    var brightness = mediaQuery.platformBrightness;
    var height = mediaQuery.size.height;
    final isDark =  brightness == Brightness.dark;

    return  Scaffold(
      body: Stack(
        children: [
            HFadeInAnimation(
              durationInMs: 1600,
              animate: HAnimatePosition(
                topAfter: 0, topBefore: -30, leftBefore: -30, leftAfter: 0,
              ),
              child: const Image(image: AssetImage(hSplashTopIcon)),
            ),
            HFadeInAnimation(
              durationInMs: 2000,
              animate: HAnimatePosition(topBefore: 80, topAfter: 80, leftAfter: hDefaultSize, leftBefore: -80),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(hAppName, style: Theme.of(context).textTheme.headlineMedium),
                  Text(hAppTagLine, style: Theme.of(context).textTheme.headlineSmall),
                ],)),
            HFadeInAnimation(
              durationInMs: 2400,
              animate: HAnimatePosition(bottomBefore: 0, bottomAfter: 100),
              child: const Image(image:  AssetImage(hSplashImage)),
            ),
            HFadeInAnimation(
              durationInMs: 2400,
              animate: HAnimatePosition(bottomBefore: 0, bottomAfter: 60, rightBefore: hDefaultSize, rightAfter: hDefaultSize),
              child: Container(
                      width: hSplashContainerSize,
                      height: hSplashContainerSize,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: hPrimaryColor,
                      ),
                    ),
                  ),
        ],
      ),
    );
  }
}


