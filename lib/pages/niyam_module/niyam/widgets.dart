// import 'dart:ui';
//
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:responsive_sizer/responsive_sizer.dart';
//
// import '../../../app/widgets/app_alert_box.dart';
// import '../../../app/widgets/app_fixed_cross_axis_count_and_height.dart';
// import '../../../app/widgets/app_image_asset.dart';
// import '../../../app/widgets/app_text.dart';
// import '../../../app/widgets/app_theme.dart';
// import '../../../app/widgets/bhajan_loader.dart';
// import '../../../constant/bhajan_assets.dart';
// import '../../../constant/color_constant.dart';
// import '../../../constant/string_constant.dart';
// import '../../../controller/niyam_controller.dart';
// import '../mukh_path/widgets.dart';
// import '../sadgranth_anusthan/widgets.dart';
// import '../sadgranth_vanchan/widgets.dart';
// import 'niyam_page.dart';
//
// SliverAppBar niyamAppBar(BuildContext context, bool isLoading) => SliverAppBar(
//       elevation: 0,
//       automaticallyImplyLeading: false,
//       backgroundColor: Colors.white,
//       expandedHeight: niyamViewModel!.niyamHeight
//           ? niyamViewModel!.selectNiyamInfoList.isEmpty
//               ? 200.px
//               : 120.px
//           : 200.px,
//       flexibleSpace: FlexibleSpaceBar(
//         background: niyamViewModel!.selectNiyamInfoList.isEmpty
//             ? buildNiyamConstView(context)
//             : buildSelectedNiyamView(context),
//       ),
//     );
//
// Column buildNiyamConstView(BuildContext context) => Column(
//       children: [
//         Padding(
//           padding: const EdgeInsets.only(top: 5, left: 12),
//           child: Row(
//             children: [
//               AppText(
//                 text: AppStringConstants.yourSelectNiyam.tr,
//                 fontFamily: AppTheme.poppins,
//                 letterSpacing: 0.75.px,
//                 fontSize: 16.px,
//                 fontWeight: FontWeight.w700,
//                 fontColor: BhajanColorConstant.black,
//               ),
//               const SizedBox(
//                 width: 10,
//               ),
//               AppText(
//                 text: AppStringConstants.selectNiyamCount,
//                 fontFamily: AppTheme.poppins,
//                 letterSpacing: 0.75.px,
//                 fontSize: 12.px,
//                 fontWeight: FontWeight.w400,
//                 fontColor: BhajanColorConstant.gray,
//               ),
//             ],
//           ),
//         ),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Expanded(
//               child: Container(
//                 margin: EdgeInsets.only(left: 15.px, top: 20),
//                 child: AppText(
//                   text: AppStringConstants.niyamMsg,
//                   letterSpacing: 0.75.px,
//                   fontSize: 14.px,
//                   fontWeight: FontWeight.w600,
//                   fontColor: BhajanColorConstant.switchColor,
//                   maxLines: 3,
//                 ),
//               ),
//             ),
//             Container(
//               margin: EdgeInsets.only(top: 30.px, left: 10.px, right: 10.px),
//               child: AppImageAsset(
//                 image: BhajanAssets.balSwami2,
//                 height: 121.px,
//                 width: 118.px,
//               ),
//             ),
//             // Container(
//             //   margin: const EdgeInsets.only(right: 25),
//             //   child: const AppImageAsset(
//             //     image: BhajanAssets.swami,
//             //   ),
//             // ),
//           ],
//         ),
//         const SizedBox(
//           height: 20,
//         ),
//       ],
//     );
//
// Column buildSelectedNiyamView(BuildContext context) => Column(
//   mainAxisSize: MainAxisSize.min,
//       children: [
//         Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Row(
//             children: [
//               AppText(
//                 text: AppStringConstants.yourSelectNiyam.tr,
//                 fontFamily: AppTheme.poppins,
//                 letterSpacing: 0.75.px,
//                 fontSize: 16.px,
//                 fontWeight: FontWeight.w700,
//                 fontColor: BhajanColorConstant.black,
//               ),
//               const SizedBox(
//                 width: 10,
//               ),
//               AppText(
//                 text: '(${niyamViewModel!.selectNiyamInfoList.length}/36)',
//                 fontFamily: AppTheme.poppins,
//                 letterSpacing: 0.75.px,
//                 fontSize: 12.px,
//                 fontWeight: FontWeight.w400,
//                 fontColor: BhajanColorConstant.gray,
//               ),
//             ],
//           ),
//         ),
//         SizedBox(
//           height: niyamViewModel!.mainNiyamList.length <= 5 ? 80.px : 160.px,
//           child: PageView(
//             scrollDirection: Axis.horizontal,
//             onPageChanged: (index) => niyamViewModel!.updateCurrentIndex(index),
//             children: List.generate(niyamViewModel!.mainNiyamList.length, (index) {
//               return GridView.builder(
//                 padding: EdgeInsets.only(left: 5.px, right: 5.px),
//                 physics: const NeverScrollableScrollPhysics(),
//                 scrollDirection: Axis.vertical,
//                 itemCount:
//                     niyamViewModel!.mainNiyamList[niyamViewModel!.currentIndex].niyamList!.length,
//                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight(
//                   crossAxisCount: 5,
//                   crossAxisSpacing: 5.0,
//                   mainAxisSpacing: 3.0,
//                   height: 80.px,
//                 ),
//                 itemBuilder: (context, index) {
//                   return Column(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       Stack(
//                         children: [
//                           Container(
//                             height: 60.px,
//                             width: 60.px,
//                             padding: EdgeInsets.all(5.px),
//                             decoration: BoxDecoration(
//                                 color: BhajanColorConstant.hex(niyamViewModel!
//                                     .mainNiyamList[niyamViewModel!.currentIndex]
//                                     .niyamList![index]
//                                     .bkColor),
//                                 shape: BoxShape.circle),
//                             child: AppImageAsset(
//                               image: niyamViewModel!.mainNiyamList[niyamViewModel!.currentIndex]
//                                   .niyamList![index].backImage,
//                               webFit: BoxFit.contain,
//                               webWidth: 60.px,
//                               webHeight: 60.px,
//                               isWebImage: true,
//                               borderRadius: 60.px,
//                             ),
//                           ),
//                           Positioned(
//                             right: 0,
//                             child: InkWell(
//                               onTap: () => niyamRemoveAlertDialog(context, index),
//                               child: Container(
//                                 padding: const EdgeInsets.all(3),
//                                 height: 15.px,
//                                 width: 15.px,
//                                 decoration: const BoxDecoration(
//                                   color: BhajanColorConstant.black,
//                                   shape: BoxShape.circle,
//                                 ),
//                                 child: const AppImageAsset(image: BhajanAssets.edit),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                       AppText(
//                         text: niyamViewModel!.mainNiyamList[niyamViewModel!.currentIndex]
//                             .niyamList![index].subCatName,
//                         fontWeight: FontWeight.w500,
//                         fontSize: 12.px,
//                         fontColor: BhajanColorConstant.black,
//                         fontStyle: FontStyle.normal,
//                       )
//                     ],
//                   );
//                 },
//               );
//             }),
//           ),
//         ),
//       ],
//     );
//
// SliverAppBar niyamAppBarSecond(NiyamController controller) => SliverAppBar(
//       elevation: 0,
//       automaticallyImplyLeading: false,
//       backgroundColor: Colors.white,
//       pinned: true,
//       expandedHeight: 50.px,
//       flexibleSpace: Container(
//         height: 31.px,
//         margin: const EdgeInsets.only(top: 15),
//         child: ListView.builder(
//             padding: const EdgeInsets.only(right: 10),
//             scrollDirection: Axis.horizontal,
//             itemCount: niyamViewModel!.categoryList.length,
//             itemBuilder: ((context, index) {
//               return Column(
//                 children: [
//                   Container(
//                     margin: const EdgeInsets.only(left: 10),
//                     padding: const EdgeInsets.symmetric(horizontal: 20),
//                     alignment: Alignment.center,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(8.px),
//                       color: niyamViewModel!.selectedIndex == index
//                           ? BhajanColorConstant.primary
//                           : BhajanColorConstant.niyamGray,
//                     ),
//                     child: Center(
//                       child: InkWell(
//                         child: AppText(
//                           text: niyamViewModel!.categoryList[index].catName,
//                           letterSpacing: 0.75.px,
//                           fontSize: 16.px,
//                           fontWeight: FontWeight.w600,
//                           fontColor: niyamViewModel!.selectedIndex == index
//                               ? BhajanColorConstant.white
//                               : BhajanColorConstant.black,
//                         ),
//                         onTap: () async {
//                           niyamViewModel!.getSelectedCategoryData(index, controller);
//                         },
//                       ),
//                     ),
//                   ),
//                 ],
//               );
//             })),
//       ),
//     );
//
// Widget niyamText() => SliverToBoxAdapter(
//       child: niyamViewModel!.selectedIndex == 1
//           ? buildSadgranthTitleSecond()
//           : niyamViewModel!.selectedIndex == 2
//               ? buildMukhPathTitleSecond()
//               : niyamViewModel!.selectedIndex == 3
//                   ? buildSadgranthTitleSecond()
//                   : Container(
//                       alignment: Alignment.centerLeft,
//                       padding: const EdgeInsets.only(left: 20),
//                       child: AppText(
//                         text: AppStringConstants.selectNiyam.tr,
//                         letterSpacing: 0.75,
//                         fontFamily: AppTheme.poppins,
//                         fontStyle: FontStyle.normal,
//                         fontSize: 16.px,
//                         fontWeight: FontWeight.w700,
//                         fontColor: BhajanColorConstant.black,
//                       ),
//                     ),
//     );
//
// // SliverToBoxAdapter niyamSliverBoxAdapter(NiyamController controller) => SliverToBoxAdapter(
// //       child: Container(
// //           color: Colors.white,
// //           height: 510.px,
// //           child: Column(
// //             children: [
// //                SizedBox(height: 10.px),
// //               Container(
// //                 alignment: Alignment.centerLeft,
// //                 padding:  EdgeInsets.only(left: 20.px),
// //                 child: AppText(
// //                   text: AppStringConstants.selectNiyam.tr,
// //                   letterSpacing: 0.75,
// //                   fontFamily: AppTheme.poppins,
// //                   fontStyle: FontStyle.normal,
// //                   fontSize: 16.px,
// //                   fontWeight: FontWeight.w700,
// //                   fontColor: BhajanColorConstant.black,
// //                 ),
// //               ),
// //               const SizedBox(
// //                 height: 10,
// //               ),
// //               niyamView(controller),
// //             ],
// //           )),
// //     );
//
// Widget niyamSliverList(NiyamController controller) => SliverList(
//       delegate: SliverChildBuilderDelegate(
//         (context, index) => Column(
//           children: [
//             niyamViewModel!.subCategoryList.isEmpty
//                 ? Center(
//                     child: AppText(
//                       text: AppStringConstants.noDataFound.tr,
//                       fontColor: BhajanColorConstant.black,
//                       fontFamily: AppTheme.baloobhai2,
//                       fontSize: 20.px,
//                     ),
//                   )
//                 : niyamViewModel!.selectedIndex == 1
//                     ? sadgranthAnusthanBodyView(controller.isLoading, context, index)
//                     : niyamViewModel!.selectedIndex == 2
//                         ? mukhPathBodyView(controller.isLoading, context, index)
//                         : niyamViewModel!.selectedIndex == 3
//                             ? sadgranthVanchanBodyView(controller.isLoading, context, index)
//                             : buildSubCategoryView(context, index, controller),
//           ],
//         ),
//         childCount: niyamViewModel!.subCategoryList.length,
//       ), //SliverChildBuildDelegate
//     );
//
// InkWell buildSubCategoryView(BuildContext context, int index, NiyamController controller) =>
//     InkWell(
//       onTap: () {
//         niyamViewModel!.onTapSubCategory(index);
//       },
//       child: Padding(
//         padding: EdgeInsets.only(left: 13.px, right: 13.px, top: 10.px),
//         child: Container(
//             alignment: Alignment.center,
//             height: 48.px,
//             decoration: BoxDecoration(
//               border: Border.all(
//                   color: niyamViewModel!.selectedIndex == 4
//                       ? BhajanColorConstant.lightPink
//                       : BhajanColorConstant.lightYellow,
//                   width: 3.px),
//               borderRadius: BorderRadius.circular(15.px),
//             ),
//             child: Row(
//               children: [
//                 Container(
//                   alignment: Alignment.center,
//                   width: 50.px,
//                   child: Stack(
//                     children: [
//                       AppImageAsset(
//                         image: BhajanAssets.squareOne,
//                         color: niyamViewModel!.selectedIndex == 4
//                             ? BhajanColorConstant.lightPink
//                             : BhajanColorConstant.lightYellow,
//                       ),
//                       Align(
//                         alignment: Alignment.center,
//                         child: Padding(
//                           padding: EdgeInsets.only(right: 5.px),
//                           child: AppText(
//                             text: '${index + 1}',
//                             textAlign: TextAlign.center,
//                             fontFamily: AppTheme.poppins,
//                             fontSize: 22.px,
//                             fontColor: BhajanColorConstant.black,
//                             letterSpacing: 0.75.px,
//                             fontWeight: FontWeight.w700,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 SizedBox(width: 5.px),
//                 Expanded(
//                   child: AppText(
//                     textAlign: TextAlign.center,
//                     text: niyamViewModel!.subCategoryList[index].subCatName,
//                     fontWeight: FontWeight.w700,
//                     fontColor: BhajanColorConstant.black,
//                     fontSize: 22.px,
//                     letterSpacing: 0.75.px,
//                   ),
//                 ),
//                 SizedBox(width: 5.px)
//               ],
//             )),
//       ),
//     );
//
// Future<void> niyamRemoveAlertDialog(BuildContext context, int index) => showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return BackdropFilter(
//           filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
//           child: AlertDialogBox(
//             contentWidget: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 AppText(
//                   text: AppStringConstants.niyamDeleteMsg.tr,
//                   textAlign: TextAlign.center,
//                   fontSize: 14.px,
//                   fontFamily: AppTheme.poppins,
//                   fontStyle: FontStyle.normal,
//                   fontColor: BhajanColorConstant.black,
//                   fontWeight: FontWeight.w400,
//                   maxLines: 2,
//                 ),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 Container(
//                   width: 249,
//                   height: 2,
//                   color: BhajanColorConstant.gray,
//                 ),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 Row(
//                   children: [
//                     Container(
//                       padding: const EdgeInsets.only(left: 25, bottom: 65),
//                       child: AppText(
//                         text: '${AppStringConstants.note.tr}:',
//                         fontSize: 16.px,
//                         fontFamily: AppTheme.poppins,
//                         fontStyle: FontStyle.normal,
//                         fontColor: BhajanColorConstant.black,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     AppText(
//                       text: AppStringConstants.niyamDeleteMsgDesc.tr,
//                       fontSize: 14.px,
//                       fontFamily: AppTheme.poppins,
//                       fontStyle: FontStyle.normal,
//                       fontColor: BhajanColorConstant.black,
//                       fontWeight: FontWeight.w400,
//                       maxLines: 4,
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 5),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Expanded(
//                       child: Container(
//                         height: 46,
//                         decoration: BoxDecoration(
//                             color: BhajanColorConstant.primary,
//                             borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15.px))),
//                         alignment: Alignment.center,
//                         child: TextButton(
//                             onPressed: () => niyamViewModel!.niyamRemoveNo(index),
//                             child: AppText(
//                                 text: AppStringConstants.edit.tr,
//                                 textAlign: TextAlign.center,
//                                 fontStyle: FontStyle.normal,
//                                 fontSize: 19.px,
//                                 fontWeight: FontWeight.w600,
//                                 fontColor: BhajanColorConstant.white)),
//                       ),
//                     ),
//                     Expanded(
//                       child: Container(
//                         height: 46,
//                         decoration: BoxDecoration(
//                             color: BhajanColorConstant.red,
//                             borderRadius: BorderRadius.only(bottomRight: Radius.circular(15.px))),
//                         alignment: Alignment.center,
//                         child: TextButton(
//                             onPressed: () {
//                               niyamViewModel!.niyamRemoveYes(index);
//                             },
//                             child: AppText(
//                                 text: AppStringConstants.yes.tr,
//                                 textAlign: TextAlign.center,
//                                 fontStyle: FontStyle.normal,
//                                 fontSize: 19,
//                                 fontWeight: FontWeight.w600,
//                                 fontColor: BhajanColorConstant.white)),
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//
// Widget loader(bool isLoading) => isLoading ? const BhajanLoader() : const SizedBox();
