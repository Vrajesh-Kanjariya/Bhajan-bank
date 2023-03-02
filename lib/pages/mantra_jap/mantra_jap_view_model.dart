import 'package:get/get.dart';

import '../../controller/mantra_jap_controller.dart';
import '../../pages/mantra_jap/mantra_jap_page.dart';
import '../../utils/shared_preference.dart';

class MantraJapViewModel{
  late MantraJapPage mantraJapPage;
  MantraJapController? mantraJapController;
  String membersId = '';
  String registrationId = '';

  MantraJapViewModel(this.mantraJapPage){
    Future.delayed(const Duration(milliseconds: 300), () async {
      mantraJapController = Get.find<MantraJapController>();
      membersId = await getPrefStringValue(memberIdKey) ?? '';
      registrationId = await getPrefStringValue(registrationId) ?? '';
    });
  }

}