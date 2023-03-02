// import 'package:bank/constant/color_constant.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:responsive_sizer/responsive_sizer.dart';
//
// import '../../../app/widgets/app_bar.dart';
// import '../../../constant/string_constant.dart';
// import '../../../controller/niyam_controller.dart';
// import '../../../pages/niyam_module/niyam/widgets.dart';
// import '../../../routes/app_navigation.dart';
// import 'niyam_view_model.dart';
//
// NiyamViewModel? niyamViewModel;
//
// class NiyamPage extends StatelessWidget {
//   const NiyamPage({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     niyamViewModel ?? (niyamViewModel = NiyamViewModel(this));
//     return GetBuilder<NiyamController>(
//       init: NiyamController(),
//       global: true,
//       autoRemove: false,
//       builder: (NiyamController controller) {
//         return WillPopScope(
//           onWillPop: () async {
//             goToHome(2);
//             return true;
//           },
//           child: SafeArea(
//             child: Scaffold(
//               appBar: PreferredSize(
//                   preferredSize: const Size.fromHeight(60),
//                   child: BhajanBankAppBar(
//                     onTap: () => goToHome(2),
//                     isShowLeading: true,
//                     isShowAction: true,
//                     isNotification: false,
//                     isShowSwitch: true,
//                     title: AppStringConstants.selectNiyam.tr.toUpperCase(),
//                   )),
//               body: Stack(
//                 children: [
//                   Container(
//                     width: Device.width,
//                     height: Device.height,
//                     color: BhajanColorConstant.white,
//                     child: CustomScrollView(
//                       shrinkWrap: true,
//                       slivers: <Widget>[
//                         niyamAppBar(context, controller.isLoading),
//                         niyamAppBarSecond(controller),
//                         niyamText(),
//                         niyamSliverList(controller),
//                         SliverPadding(padding: EdgeInsets.only(bottom: 10.px))
//                       ],
//                     ),
//                   ),
//                   loader(controller.isLoading),
//                 ],
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
