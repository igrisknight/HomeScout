import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:homescout/src/constants/sizes.dart";
import "package:homescout/src/constants/text_string.dart";
import "package:homescout/src/features/authentication/screens/forget_password/forget_password_mail/forget_password_mail.dart";
import "package:homescout/src/features/authentication/screens/forget_password/forget_password_options/forget_password_btn_widget.dart";

class ForgetPasswordScreen {
  static Future<dynamic> buildShowModalBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      builder: (context) =>
          Container(
            padding: EdgeInsets.all(hDefaultSize),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(hForgetPasswordTitle, style: Theme
                    .of(context)
                    .textTheme
                    .displayMedium,),
                Text(hForgetPasswordSubTitle, style: Theme
                    .of(context)
                    .textTheme
                    .bodyMedium,),
                const SizedBox(height: 30.0),
                ForgetPasswordBtnWidget(
                  onTap: () {
                    print("email btn taped");
                    Navigator.pop(context);
                    print("attempting to navigate to ForgetPasswordMailScreen");
                    Get.to(() => const ForgetPasswordMailScreen());

                  },
                  btnIcon: Icons.mail_outline_rounded,
                  title: hEmail,
                  subTitle: hResetViaEMail,
                ),
                const SizedBox(height: 20.0,),
                ForgetPasswordBtnWidget(
                  onTap: () {},
                  btnIcon: Icons.mobile_friendly_rounded,
                  title: hPhoneNo,
                  subTitle: hResetViaPhone,
                ),

              ],
            ),
          ),
    );
  }
}