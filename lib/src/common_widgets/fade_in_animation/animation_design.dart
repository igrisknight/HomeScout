import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homescout/src/common_widgets/fade_in_animation/fade_in_animation_model.dart';
import 'fade_in_animation_controller.dart';
import '../../constants/image_string.dart';

class HFadeInAnimation extends StatelessWidget {
  HFadeInAnimation({
    super.key,
    required this. durationInMs,
    required this.child,
    this.animate
  });

  final controller = Get.put(FadeInAnimationController());
  final int durationInMs;
  final HAnimatePosition? animate;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Obx(() => AnimatedPositioned(
      duration:  Duration(milliseconds: durationInMs),
      top: controller.animate.value ? animate!.topAfter : animate!.topBefore,
      left: controller.animate.value ? animate!.leftAfter : animate!.leftBefore,
      bottom: controller.animate.value ? animate!.bottomAfter : animate!.bottomBefore,
      right: controller.animate.value ? animate!.rightAfter : animate!.rightBefore,
      child: AnimatedOpacity(
          opacity: controller.animate.value ? 1 : 0,
          duration: Duration(milliseconds: durationInMs),
          child: child,
          //child: const Image(image: AssetImage(hSplashTopIcon),

      ),
    ),
    );
  }
}
