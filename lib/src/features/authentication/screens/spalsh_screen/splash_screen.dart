import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homescout/src/constants/colors.dart';
import 'package:homescout/src/constants/image_string.dart';
import 'package:homescout/src/constants/sizes.dart';
import 'package:homescout/src/constants/text_string.dart';
import 'package:homescout/src/features/authentication/controllers/splash_screen_controller.dart';


class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  final splashController = Get.put(SplashScreenController());

  @override
  Widget build(BuildContext context) {
    splashController.startAnimation();
    return  Scaffold(
      body: Stack(
        children: [
            Obx(() => AnimatedPositioned(
                duration:  const Duration(milliseconds: 1600),
                top: splashController.animate.value ? 0 : -30,
                left: splashController.animate.value ? 0 : -30,
                child: const Image(image:  AssetImage(hSplashTopIcon)),
              ),
            ),
            Obx(() => AnimatedPositioned(
                duration:  const Duration(milliseconds: 1600),
                top: 80,
                left: splashController.animate.value ? hDefaultSize : -80,
                child: AnimatedOpacity(
                  duration:  const Duration(milliseconds: 1600),
                  opacity: splashController.animate.value ? 1 : 0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(hAppName, style: Theme.of(context).textTheme.headlineMedium),
                      Text(hAppTagLine, style: Theme.of(context).textTheme.headlineSmall),
                    ],
                  ),
                ),
              ),
            ),
            Obx(() => AnimatedPositioned(
                duration:  const Duration(milliseconds: 2400),
                left: splashController.animate.value ? 20 : 0,
                bottom: splashController.animate.value ? 100 : 0,
                child: AnimatedOpacity(
                    opacity: splashController.animate.value ? 1 : 0,
                    duration:  const Duration(milliseconds: 2400),
                    child:  const Image(image:  AssetImage(hSplashImage)),
                ),
              ),
            ),
            Obx(
              () => AnimatedPositioned(
                  duration:  const Duration(milliseconds: 2400),
                  bottom: splashController.animate.value ? 40 : 0,
                  right: hDefaultSize,
                  child: AnimatedOpacity(
                    duration:  const Duration(milliseconds: 2000),
                    opacity: splashController.animate.value ? 1 : 0,
                    child: Container(
                      width: hSplashContainerSize,
                      height: hSplashContainerSize,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: hPrimaryColor,
                      ),
                    ),
                  ),
              ),
            ),
          ],
        ),
      );
  }


}
