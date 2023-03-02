import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../app/widgets/common_app_bar.dart';
import '../../../../controller/niyam_controller.dart';
import '../../../../routes/app_navigation.dart';
import '../../../niyam_module/edit_niyam/edit_niyam_sadgranth_anusthan/edit_niyam_sadgranth_anusthan_view_model.dart';
import '../../../niyam_module/edit_niyam/edit_niyam_sadgranth_anusthan/widgets.dart';

EditNiyamSadgranthAnusthanViewModel? editNiyamSadgranthAnusthanViewModel;

class EditNiyamSadgranthAnusthanPage extends StatelessWidget {
  const EditNiyamSadgranthAnusthanPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    editNiyamSadgranthAnusthanViewModel ??
        (editNiyamSadgranthAnusthanViewModel = EditNiyamSadgranthAnusthanViewModel(this));
    return GetBuilder<NiyamController>(
      initState: editNiyamSadgranthAnusthanViewModel!.getArguments(),
      builder: (_) {
        return SafeArea(
          child: WillPopScope(
            onWillPop: () async {
              editNiyamSadgranthAnusthanViewModel = null;
              gotoBack();
              return true;
            },
            child: Scaffold(
              appBar: PreferredSize(
                  preferredSize: const Size.fromHeight(60),
                  child: CommonAppBar(
                    onTap: () {
                      editNiyamSadgranthAnusthanViewModel = null;
                      gotoBack();
                    },
                    isInformation: true,
                    isShowSwitch: true,
                    title: editNiyamSadgranthAnusthanViewModel!
                        .selectNiyamInfoList[editNiyamSadgranthAnusthanViewModel!.selectedIndex]
                        .catName,
                  )),
              floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
              floatingActionButton: floatingActionButton(),
              body: editSadgranthAnusthanBodyView(context),
            ),
          ),
        );
      },
    );
  }
}
