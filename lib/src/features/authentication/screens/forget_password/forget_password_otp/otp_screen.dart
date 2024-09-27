import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homescout/src/constants/sizes.dart';
import 'package:homescout/src/constants/text_string.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(hDefaultSize),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(hOtpTitle, style: GoogleFonts.montserrat(
              fontWeight: FontWeight.bold,
              fontSize: 80.0
            ),),
            Text(hOtpSubTitle.toUpperCase(), style: Theme.of(context).textTheme.titleLarge,),
            const SizedBox(height: 40.0,),
            Text("$hOtpMessage support@homey.com", textAlign: TextAlign.center,),
            const SizedBox(height: 20.0,),
            OtpTextField(
              numberOfFields: 6,
              fillColor: Colors.black.withOpacity(0.1),
              filled: true,
              onSubmit: (code){ print("OTP is => $code"); },
            ),
            const SizedBox(height: 20.0),
            SizedBox(
              width: double.infinity,
                child: ElevatedButton(
                    onPressed: (){},
                    child: const Text(hNext),
                )),

          ],
        ),
      ),
    );
  }
}
