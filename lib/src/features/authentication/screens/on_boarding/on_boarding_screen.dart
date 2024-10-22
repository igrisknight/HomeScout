import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homescout/src/features/authentication/controllers/on_boarding_controller.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
class OnBoardingScreen extends StatelessWidget {
  OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final obController = OnBoardingController();
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          LiquidSwipe(
           pages: obController.pages,
            liquidController: obController.controller,
            onPageChangeCallback: obController.onPageChangeCallback,
            slideIconWidget: const Icon(Icons.arrow_back_ios),
            enableSideReveal: true,
          ),
          Positioned(
              bottom: 60.0,
              child: OutlinedButton(
                  onPressed: () => obController.animateToNextSlide(),
                  style: ElevatedButton.styleFrom(
                    side: const BorderSide(color: Colors.black26),
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(20),
                    overlayColor: Colors.white,
                  ),
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: const BoxDecoration(
                    color: Color(0xFF272727), shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.arrow_forward_ios),
                ),
              ),
          ),
          Positioned(
              top: 50,
              right: 20,
              child: TextButton(
                  onPressed: () => obController.skip(),
              child: const Text("Skip", style: TextStyle(color: Colors.grey),))
          ),
          Obx(() => Positioned(
              bottom: 5,
                child: AnimatedSmoothIndicator(
                    activeIndex: obController.currentPage.value,
                    count: 3,
                    effect: const WormEffect(
                      activeDotColor: Color(0xFF272727),
                      dotHeight: 5.0,
                    ),
                ),
            ),
          )
        ],
      ),
    );
  }


  }

