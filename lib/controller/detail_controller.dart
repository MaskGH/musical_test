import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:musical_app/model/dbs.dart';
import 'package:musical_app/repository/home_repository.dart';

class DetailController extends GetxController {
  var mt20id = Get.parameters['mt20id'];
  // Db? db;
  Rx<DB> dbResult = DB().obs;  
  // DetailController({this.db});

  @override
  void onInit() async {
    _detailLoad();
    super.onInit();
  }

  void _detailLoad() async {
    DB? dbs = await HomeRepository.to.loadMusicalDetail(mt20id);
    if (dbs != null && dbs.mt20id != null) {
      dbResult(dbs);
    }
  }

}
