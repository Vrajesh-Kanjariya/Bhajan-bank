import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/meaning_mahima_history_controller.dart';
import '../../../pages/selected_niyam_module/meaning_mahima_history/meaning_mahima_history_view_model.dart';
import '../../../pages/selected_niyam_module/meaning_mahima_history/widgets.dart';

MeaningMahimaHistoryViewModel? meaningMahimaHistoryViewModel;

class MeaningMahimaHistoryPage extends StatelessWidget {
  const MeaningMahimaHistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    meaningMahimaHistoryViewModel ??
        (meaningMahimaHistoryViewModel = MeaningMahimaHistoryViewModel(this));

    return GetBuilder<MeaningMahimaHistoryController>(
      init: MeaningMahimaHistoryController(),
      builder: (MeaningMahimaHistoryController controller) {
        return WillPopScope(
          onWillPop: () async {
            meaningMahimaHistoryViewModel = null;
            return true;
          },
          child: Scaffold(
            body: buildMeaningMahimaHistoryBodyView(),
          ),
        );
      },
    );
  }
}
