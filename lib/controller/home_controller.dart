import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:musical_app/model/db.dart';

import 'package:musical_app/repository/home_repository.dart';

class HomeController extends GetxController {
  static HomeController get to => Get.find();

  Rx<DbsResult> dbsListResult = DbsResult().obs;
  Rx<DbsResult> dbsTheaterResult = DbsResult().obs;
  Rx<DbsResult> dbsAll = DbsResult().obs;



  @override
  void onInit() async {
    _musicalLoad();
    _theaterLoad();
    _allLoad();    
    // _detailLoad();
    super.onInit();
  }

  void _allLoad() async {
    DbsResult? dbsResult = await HomeRepository.to.loadAll();
    if (dbsResult != null && dbsResult.db != null && dbsResult.db!.length > 0) {
      dbsAll(dbsResult);
    }
  }

  void _musicalLoad() async {
    DbsResult? dbsResult = await HomeRepository.to.loadMusicals();
    if (dbsResult != null && dbsResult.db != null && dbsResult.db!.length > 0) {
      dbsListResult(dbsResult);
    }
  }

  void _theaterLoad() async {
    DbsResult? dbsResult = await HomeRepository.to.loadTheater();
    if (dbsResult != null && dbsResult.db != null && dbsResult.db!.length > 0) {
      dbsTheaterResult(dbsResult);
    }
  }

  // void _detailLoad() async {
  //   DB? dbs = await HomeRepository.to.loadMusicalDetail(db?.mt20id);
  //   if (dbs != null) {
  //     dbResult(dbs);
  //   }
  // }
}
