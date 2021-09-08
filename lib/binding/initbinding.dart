import 'package:get/instance_manager.dart';
import 'package:musical_app/controller/app_controller.dart';
import 'package:musical_app/controller/search_controller.dart';
import 'package:musical_app/repository/home_repository.dart';

class InitBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(AppController());
    Get.put(HomeRepository(), permanent: true);
    Get.put(SearchController());
  }
}
