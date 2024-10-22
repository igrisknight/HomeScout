import 'package:flutter/material.dart';
import 'package:homescout/src/constants/colors.dart';
import 'package:homescout/src/features/core/models/dashboard/categories_models.dart';


class DashBoardCategories extends StatelessWidget {
  const DashBoardCategories({
    super.key,
    required this.txtTheme,
  });

  final TextTheme txtTheme;

  @override
  Widget build(BuildContext context) {
    final list = DashBoardCategoriesModels.list;
    return SizedBox(
      height: 45,
      child: ListView.builder(
        itemCount: list.length,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => GestureDetector(
          onTap: list[index].onPress,
          child: SizedBox(
            width: 170,
            height: 45,
            child: Row(
              children: [
                Container(
                  width: 45,
                  height: 45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: hDarkColor,
                  ),
                  child: Center(
                    child: Text(list[index].title,
                        style: txtTheme.titleLarge
                            ?.apply(color: Colors.white)),
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        list[index].heading,
                        style: txtTheme.titleLarge,
                        overflow: TextOverflow.ellipsis,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        // children: [
        //   SizedBox(
        //     width: 170,
        //     height: 45,
        //     child: Row(
        //       children: [
        //         Container(
        //           width: 45,
        //           height: 45,
        //           decoration: BoxDecoration(
        //             borderRadius: BorderRadius.circular(10),
        //             color: hDarkColor,
        //           ),
        //           child: Center(
        //             child: Text("A",
        //                 style: txtTheme.titleLarge
        //                     ?.apply(color: Colors.white)),
        //           ),
        //         ),
        //         SizedBox(
        //           width: 5,
        //         ),
        //         Flexible(
        //           child: Column(
        //             crossAxisAlignment: CrossAxisAlignment.start,
        //             mainAxisAlignment: MainAxisAlignment.center,
        //             children: [
        //               Text(
        //                 "Apartment",
        //                 style: txtTheme.titleLarge,
        //                 overflow: TextOverflow.ellipsis,
        //               )
        //             ],
        //           ),
        //         )
        //       ],
        //     ),
        //   ),
        //   SizedBox(
        //     width: 170,
        //     height: 45,
        //     child: Row(
        //       children: [
        //         Container(
        //           width: 45,
        //           height: 45,
        //           decoration: BoxDecoration(
        //             borderRadius: BorderRadius.circular(10),
        //             color: hDarkColor,
        //           ),
        //           child: Center(
        //             child: Text("A",
        //                 style: txtTheme.titleLarge
        //                     ?.apply(color: Colors.white)),
        //           ),
        //         ),
        //         SizedBox(
        //           width: 5,
        //         ),
        //         Flexible(
        //           child: Column(
        //             crossAxisAlignment: CrossAxisAlignment.start,
        //             mainAxisAlignment: MainAxisAlignment.center,
        //             children: [
        //               Text(
        //                 "Apartment",
        //                 style: txtTheme.titleLarge,
        //                 overflow: TextOverflow.ellipsis,
        //               )
        //             ],
        //           ),
        //         )
        //       ],
        //     ),
        //   ),
        //   SizedBox(
        //     width: 170,
        //     height: 45,
        //     child: Row(
        //       children: [
        //         Container(
        //           width: 45,
        //           height: 45,
        //           decoration: BoxDecoration(
        //             borderRadius: BorderRadius.circular(10),
        //             color: hDarkColor,
        //           ),
        //           child: Center(
        //             child: Text("A",
        //                 style: txtTheme.titleLarge
        //                     ?.apply(color: Colors.white)),
        //           ),
        //         ),
        //         SizedBox(
        //           width: 5,
        //         ),
        //         Flexible(
        //           child: Column(
        //             crossAxisAlignment: CrossAxisAlignment.start,
        //             mainAxisAlignment: MainAxisAlignment.center,
        //             children: [
        //               Text(
        //                 "Apartment",
        //                 style: txtTheme.titleLarge,
        //                 overflow: TextOverflow.ellipsis,
        //               )
        //             ],
        //           ),
        //         )
        //       ],
        //     ),
        //   ),
        // ],
      ),
    );
  }
}