import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liquid_swipe/liquid_swipe.dart';

import '../../../constants/colors.dart';
import '../../../constants/image_string.dart';
import '../../../constants/text_string.dart';
import '../models/model_on_boarding.dart';
import '../screens/on_boarding/on_boarding_page_widget.dart';

class OnBoardingController extends GetxController {

  final controller = LiquidController();
  RxInt currentPage = 0.obs;

  final pages = [
    OnBoardingPageWidget(
        model: OnBoardingModel(
          image: hOnBoardingPage1Image,
          title: hOnBoardingPage1Title,
          subTitle: hOnBoardingPage1SubTitle,
          counterText: hOnBoardingCounter1,
          bgColor: hOnBoardingPage1Color,
        )),
    OnBoardingPageWidget(
        model: OnBoardingModel(
            image: hOnBoardingPage2Image,
            title: hOnBoardingPage2Title,
            subTitle: hOnBoardingPage2SubTitle,
            counterText: hOnBoardingCounter2,
            bgColor: hOnBoardingPage2Color,
        )),
    OnBoardingPageWidget(
        model: OnBoardingModel(
          image: hOnBoardingPage3Image,
          title: hOnBoardingPage3Title,
          subTitle: hOnBoardingPage3SubTitle,
          counterText: hOnBoardingCounter3,
          bgColor: hOnBoardingPage3Color,
        )),
  ];

  skip() => controller.jumpToPage(page: 2);
  animateToNextSlide() {
    int nextPage = controller.currentPage + 1;
    controller.animateToPage(page: nextPage);
  }

  void onPageChangeCallback(int activePageIndex) => currentPage.value = activePageIndex;

}