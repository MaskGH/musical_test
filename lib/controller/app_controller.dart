import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

enum RouteName {
  Home,
  Search,
  Library,
  Person,
}

class AppController extends GetxService {
  static AppController get to => Get.find();
  RxInt currentIndex = 0.obs;

  changeCurrentIndex(int index) {
    currentIndex(index);
  }
}
