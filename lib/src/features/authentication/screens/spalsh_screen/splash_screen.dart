import 'package:flutter/material.dart';
import 'package:homescout/src/constants/image_string.dart';
import 'package:homescout/src/constants/sizes.dart';
import 'package:homescout/src/constants/text_string.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            /*const Positioned(
              top: 0,
              left: 0,
              child: Image(image:  AssetImage(hSplashTopIcon)),
            ),*/
            Positioned(
              top: 80,
              left: hDefaultSize,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(hAppName, style: Theme.of(context).textTheme.headlineMedium),
                  Text(hAppTagLine, style: Theme.of(context).textTheme.headlineSmall),
                ],
              ),
            ),
            const Positioned(
              bottom: 100,
              child: Image(image:  AssetImage(hSplashImage)),
            ),
          ],
        ),
      ),
    );
  }
}
