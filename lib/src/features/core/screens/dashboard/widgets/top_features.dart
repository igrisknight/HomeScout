import 'package:flutter/material.dart';
import 'package:homescout/src/constants/colors.dart';
import 'package:homescout/src/constants/image_string.dart';
import 'package:homescout/src/constants/sizes.dart';
import 'package:homescout/src/features/core/models/dashboard/features_model.dart';


class DashBoardFeatures extends StatelessWidget {
  const DashBoardFeatures({
    super.key,
    required this.txtTheme,
  });

  final TextTheme txtTheme;

  @override
  Widget build(BuildContext context) {
    final list = DashBoardFeaturesModels.list;
    return SizedBox(
      height: 200,
      child: ListView.builder(
        itemCount: list.length,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => SizedBox(
          width: 350,
          height: 200,
          child: Padding(
            padding: const EdgeInsets.only(right: 10, top: 5),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: hCardBgColor),
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                          child: Text(
                            list[index].title,
                            style: txtTheme.headlineMedium,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          )),
                      Flexible(
                          child: Image.asset(list[index].imagePath),),
                    ],
                  ),
                  SizedBox(height: hDashboardCardPadding,),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: list[index].onPress,
                        child: ElevatedButton(

                            style: ElevatedButton.styleFrom(
                                shape: const CircleBorder()),
                            onPressed: () {},
                            child: const Icon(Icons.play_arrow)),
                      ),
                      const SizedBox(
                        width: hDashboardCardPadding,
                        height: hDashboardCardPadding,
                      ),
                      Column(
                        crossAxisAlignment:
                        CrossAxisAlignment.start,
                        children: [
                          Text(
                            list[index].heading,
                            style: txtTheme.headlineMedium,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            list[index].subHeading,
                            style: txtTheme.bodyMedium,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        // children: [
        //   SizedBox(
        //     width: 350,
        //     height: 200,
        //     child: Padding(
        //       padding: const EdgeInsets.only(right: 10, top: 5),
        //       child: Container(
        //         decoration: BoxDecoration(
        //             borderRadius: BorderRadius.circular(10),
        //             color: hCardBgColor),
        //         padding: EdgeInsets.all(8),
        //         child: Column(
        //           crossAxisAlignment: CrossAxisAlignment.start,
        //           children: [
        //             Row(
        //               mainAxisAlignment:
        //               MainAxisAlignment.spaceBetween,
        //               children: [
        //                 Flexible(
        //                     child: Text(
        //                       "Hot Properties\nNear You",
        //                       style: txtTheme.headlineMedium,
        //                       maxLines: 2,
        //                       overflow: TextOverflow.ellipsis,
        //                     )),
        //                 Flexible(
        //                     child: Image(
        //                         image: AssetImage(hHotProperty)))
        //               ],
        //             ),
        //             Row(
        //               children: [
        //                 ElevatedButton(
        //                     style: ElevatedButton.styleFrom(
        //                         shape: CircleBorder()),
        //                     onPressed: () {},
        //                     child: Icon(Icons.play_arrow)),
        //                 const SizedBox(
        //                   width: hDashboardCardPadding,
        //                   height: hDashboardCardPadding,
        //                 ),
        //                 Column(
        //                   crossAxisAlignment:
        //                   CrossAxisAlignment.start,
        //                   children: [
        //                     Text(
        //                       "3 BHK Apartments",
        //                       style: txtTheme.headlineMedium,
        //                       overflow: TextOverflow.ellipsis,
        //                     ),
        //                     Text(
        //                       "Prime Location",
        //                       style: txtTheme.bodyMedium,
        //                       overflow: TextOverflow.ellipsis,
        //                     ),
        //                   ],
        //                 )
        //               ],
        //             )
        //           ],
        //         ),
        //       ),
        //     ),
        //   ),
        //   SizedBox(
        //     width: 350,
        //     height: 200,
        //     child: Padding(
        //       padding: const EdgeInsets.only(right: 10, top: 5),
        //       child: Container(
        //         decoration: BoxDecoration(
        //             borderRadius: BorderRadius.circular(10),
        //             color: hCardBgColor),
        //         padding: EdgeInsets.all(8),
        //         child: Column(
        //           crossAxisAlignment: CrossAxisAlignment.start,
        //           children: [
        //             Row(
        //               mainAxisAlignment:
        //               MainAxisAlignment.spaceBetween,
        //               children: [
        //                 Flexible(
        //                     child: Text(
        //                       "Hot Properties\nNear You",
        //                       style: txtTheme.headlineMedium,
        //                       maxLines: 2,
        //                       overflow: TextOverflow.ellipsis,
        //                     )),
        //                 Flexible(
        //                     child: Image(
        //                         image: AssetImage(hHotProperty)))
        //               ],
        //             ),
        //             Row(
        //               children: [
        //                 ElevatedButton(
        //                     style: ElevatedButton.styleFrom(
        //                         shape: CircleBorder()),
        //                     onPressed: () {},
        //                     child: Icon(Icons.play_arrow)),
        //                 const SizedBox(
        //                   width: hDashboardCardPadding,
        //                   height: hDashboardCardPadding,
        //                 ),
        //                 Column(
        //                   crossAxisAlignment:
        //                   CrossAxisAlignment.start,
        //                   children: [
        //                     Text(
        //                       "3 BHK Apartments",
        //                       style: txtTheme.headlineMedium,
        //                       overflow: TextOverflow.ellipsis,
        //                     ),
        //                     Text(
        //                       "Prime Location",
        //                       style: txtTheme.bodyMedium,
        //                       overflow: TextOverflow.ellipsis,
        //                     ),
        //                   ],
        //                 )
        //               ],
        //             )
        //           ],
        //         ),
        //       ),
        //     ),
        //   ),
        //   SizedBox(
        //     width: 350,
        //     height: 200,
        //     child: Padding(
        //       padding: const EdgeInsets.only(right: 10, top: 5),
        //       child: Container(
        //         decoration: BoxDecoration(
        //             borderRadius: BorderRadius.circular(10),
        //             color: hCardBgColor),
        //         padding: EdgeInsets.all(8),
        //         child: Column(
        //           crossAxisAlignment: CrossAxisAlignment.start,
        //           children: [
        //             Row(
        //               mainAxisAlignment:
        //               MainAxisAlignment.spaceBetween,
        //               children: [
        //                 Flexible(
        //                     child: Text(
        //                       "Hot Properties\nNear You",
        //                       style: txtTheme.headlineMedium,
        //                       maxLines: 2,
        //                       overflow: TextOverflow.ellipsis,
        //                     )),
        //                 Flexible(
        //                     child: Image(
        //                         image: AssetImage(hHotProperty)))
        //               ],
        //             ),
        //             Row(
        //               children: [
        //                 ElevatedButton(
        //                     style: ElevatedButton.styleFrom(
        //                         shape: CircleBorder()),
        //                     onPressed: () {},
        //                     child: Icon(Icons.play_arrow)),
        //                 const SizedBox(
        //                   width: hDashboardCardPadding,
        //                   height: hDashboardCardPadding,
        //                 ),
        //                 Column(
        //                   crossAxisAlignment:
        //                   CrossAxisAlignment.start,
        //                   children: [
        //                     Text(
        //                       "3 BHK Apartments",
        //                       style: txtTheme.headlineMedium,
        //                       overflow: TextOverflow.ellipsis,
        //                     ),
        //                     Text(
        //                       "Prime Location",
        //                       style: txtTheme.bodyMedium,
        //                       overflow: TextOverflow.ellipsis,
        //                     ),
        //                   ],
        //                 )
        //               ],
        //             )
        //           ],
        //         ),
        //       ),
        //     ),
        //   ),
        //   SizedBox(
        //     width: 350,
        //     height: 200,
        //     child: Padding(
        //       padding: const EdgeInsets.only(right: 10, top: 5),
        //       child: Container(
        //         decoration: BoxDecoration(
        //             borderRadius: BorderRadius.circular(10),
        //             color: hCardBgColor),
        //         padding: EdgeInsets.all(8),
        //         child: Column(
        //           crossAxisAlignment: CrossAxisAlignment.start,
        //           children: [
        //             Row(
        //               mainAxisAlignment:
        //               MainAxisAlignment.spaceBetween,
        //               children: [
        //                 Flexible(
        //                     child: Text(
        //                       "Hot Properties\nNear You",
        //                       style: txtTheme.headlineMedium,
        //                       maxLines: 2,
        //                       overflow: TextOverflow.ellipsis,
        //                     )),
        //                 Flexible(
        //                     child: Image(
        //                         image: AssetImage(hHotProperty)))
        //               ],
        //             ),
        //             Row(
        //               children: [
        //                 ElevatedButton(
        //                     style: ElevatedButton.styleFrom(
        //                         shape: CircleBorder()),
        //                     onPressed: () {},
        //                     child: Icon(Icons.play_arrow)),
        //                 const SizedBox(
        //                   width: hDashboardCardPadding,
        //                   height: hDashboardCardPadding,
        //                 ),
        //                 Column(
        //                   crossAxisAlignment:
        //                   CrossAxisAlignment.start,
        //                   children: [
        //                     Text(
        //                       "3 BHK Apartments",
        //                       style: txtTheme.headlineMedium,
        //                       overflow: TextOverflow.ellipsis,
        //                     ),
        //                     Text(
        //                       "Prime Location",
        //                       style: txtTheme.bodyMedium,
        //                       overflow: TextOverflow.ellipsis,
        //                     ),
        //                   ],
        //                 )
        //               ],
        //             )
        //           ],
        //         ),
        //       ),
        //     ),
        //   ),
        //   SizedBox(
        //     width: 350,
        //     height: 200,
        //     child: Padding(
        //       padding: const EdgeInsets.only(right: 10, top: 5),
        //       child: Container(
        //         decoration: BoxDecoration(
        //             borderRadius: BorderRadius.circular(10),
        //             color: hCardBgColor),
        //         padding: EdgeInsets.all(8),
        //         child: Column(
        //           crossAxisAlignment: CrossAxisAlignment.start,
        //           children: [
        //             Row(
        //               mainAxisAlignment:
        //               MainAxisAlignment.spaceBetween,
        //               children: [
        //                 Flexible(
        //                     child: Text(
        //                       "Hot Properties\nNear You",
        //                       style: txtTheme.headlineMedium,
        //                       maxLines: 2,
        //                       overflow: TextOverflow.ellipsis,
        //                     )),
        //                 Flexible(
        //                     child: Image(
        //                         image: AssetImage(hHotProperty)))
        //               ],
        //             ),
        //             Row(
        //               children: [
        //                 ElevatedButton(
        //                     style: ElevatedButton.styleFrom(
        //                         shape: CircleBorder()),
        //                     onPressed: () {},
        //                     child: Icon(Icons.play_arrow)),
        //                 const SizedBox(
        //                   width: hDashboardCardPadding,
        //                   height: hDashboardCardPadding,
        //                 ),
        //                 Column(
        //                   crossAxisAlignment:
        //                   CrossAxisAlignment.start,
        //                   children: [
        //                     Text(
        //                       "3 BHK Apartments",
        //                       style: txtTheme.headlineMedium,
        //                       overflow: TextOverflow.ellipsis,
        //                     ),
        //                     Text(
        //                       "Prime Location",
        //                       style: txtTheme.bodyMedium,
        //                       overflow: TextOverflow.ellipsis,
        //                     ),
        //                   ],
        //                 )
        //               ],
        //             )
        //           ],
        //         ),
        //       ),
        //     ),
        //   ),
        //   SizedBox(
        //     width: 350,
        //     height: 200,
        //     child: Padding(
        //       padding: const EdgeInsets.only(right: 10, top: 5),
        //       child: Container(
        //         decoration: BoxDecoration(
        //             borderRadius: BorderRadius.circular(10),
        //             color: hCardBgColor),
        //         padding: EdgeInsets.all(8),
        //         child: Column(
        //           crossAxisAlignment: CrossAxisAlignment.start,
        //           children: [
        //             Row(
        //               mainAxisAlignment:
        //               MainAxisAlignment.spaceBetween,
        //               children: [
        //                 Flexible(
        //                     child: Text(
        //                       "Hot Properties\nNear You",
        //                       style: txtTheme.headlineMedium,
        //                       maxLines: 2,
        //                       overflow: TextOverflow.ellipsis,
        //                     )),
        //                 Flexible(
        //                     child: Image(
        //                         image: AssetImage(hHotProperty)))
        //               ],
        //             ),
        //             Row(
        //               children: [
        //                 ElevatedButton(
        //                     style: ElevatedButton.styleFrom(
        //                         shape: CircleBorder()),
        //                     onPressed: () {},
        //                     child: Icon(Icons.play_arrow)),
        //                 const SizedBox(
        //                   width: hDashboardCardPadding,
        //                   height: hDashboardCardPadding,
        //                 ),
        //                 Column(
        //                   crossAxisAlignment:
        //                   CrossAxisAlignment.start,
        //                   children: [
        //                     Text(
        //                       "3 BHK Apartments",
        //                       style: txtTheme.headlineMedium,
        //                       overflow: TextOverflow.ellipsis,
        //                     ),
        //                     Text(
        //                       "Prime Location",
        //                       style: txtTheme.bodyMedium,
        //                       overflow: TextOverflow.ellipsis,
        //                     ),
        //                   ],
        //                 )
        //               ],
        //             )
        //           ],
        //         ),
        //       ),
        //     ),
        //   ),
        // ],
      ),
    );
  }
}