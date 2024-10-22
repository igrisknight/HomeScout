import 'package:flutter/material.dart';
import 'package:homescout/src/constants/colors.dart';
import 'package:homescout/src/constants/image_string.dart';
import 'package:homescout/src/constants/sizes.dart';
import 'package:homescout/src/constants/text_string.dart';


class DashBoardBanner extends StatelessWidget {
  const DashBoardBanner({
    super.key,
    required this.txtTheme,
  });

  final TextTheme txtTheme;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: hCardBgColor),
            padding: const EdgeInsets.symmetric(
                horizontal: 10, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Flexible(
                        child: Image(
                            image: AssetImage(hBookmarkIcon))),
                    Flexible(
                        child:
                        Image(image: AssetImage(hBannerImage1)))
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  hDashBoardBannerTitle1,
                  style: txtTheme.headlineMedium,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          width: hDashboardCardPadding,
        ),
        Expanded(
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: hCardBgColor),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10, vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Flexible(
                              child: Image(
                                  image: AssetImage(hBookmarkIcon))),
                          Flexible(
                              child: Image(
                                  image: AssetImage(hBannerImage2)))
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        hDashBoardBannerTitle2,
                        style: txtTheme.headlineMedium,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                      onPressed: () {}, child: Text(hDashBoardButton)),
                )
              ],
            ))
      ],
    );
  }
}