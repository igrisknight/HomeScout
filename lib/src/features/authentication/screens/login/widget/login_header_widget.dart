import 'package:flutter/material.dart';
import 'package:homescout/src/constants/image_string.dart';
import 'package:homescout/src/constants/text_string.dart';

class LoginHeaderWidget extends StatelessWidget {
  const LoginHeaderWidget({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image(image: AssetImage(hWelcomeScreenImage), height: size.height * 0.2,),
        Text(hLoginTitle, style: Theme.of(context).textTheme.displayLarge,),
        Text(hLoginSubTitle, style: Theme.of(context).textTheme.bodyLarge,),

      ],
    );
  }
}
