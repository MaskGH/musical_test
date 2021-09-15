import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:musical_app/model/dbs.dart';


class PersonController extends GetxController {
  List<DB> list = [];
  var lili = {}.obs;
  

  void addCart(DB db) {
    if (db.mt20id != null && db.prfpdto != null) {
      list.addIf(!list.contains(db), db);
      
      Get.snackbar(
        "장바구니",
        "장바구니에 추가 완료하였습니다.",
        snackStyle: SnackStyle.GROUNDED,
        duration: Duration(milliseconds: 700),
      );
    } else {
      Get.snackbar(
        "장바구니",
        "이미 장바구니에 추가 되었습니다.",
        duration: Duration(milliseconds: 1000),
      );
    }
  }

  void removeCart(DB db) {
    if (list.contains(db) == 1) {
      list.removeWhere((key) => key == db);
    } else {
      list.remove(db);
      
    }
  }

  // void pay(){
  //   Get.snackbar("결제불가", "");
  // }

  get dblist => list;
}
