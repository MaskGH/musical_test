import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:musical_app/model/db.dart';
import 'package:musical_app/repository/home_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SearchController extends GetxController {
  String key = "SearchKey";
  RxList<String> history = RxList<String>.empty(growable: true);
  SharedPreferences? profs;
  Rx<DbsResult> dbsresult = DbsResult(db: []).obs;

  @override
  void onInit() async {
    super.onInit();
    profs = await SharedPreferences.getInstance();
    List<dynamic>? initData = (profs?.get(key) ?? []) as List;
    history(initData.map((e) => e.toString()).toList());
  }

  void submitSearch(String searchKey) {
    history.addIf(!history.contains(searchKey), searchKey);
    profs?.setStringList(key, history);
    _searchInfo(searchKey);
  }

  void _searchInfo(String searchKey) async{
     DbsResult? dbsResult = await HomeRepository.to.searchLoad(searchKey);
     dbsresult(dbsResult);
  }
}
