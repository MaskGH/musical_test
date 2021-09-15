import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:musical_app/model/db.dart';
import 'package:musical_app/repository/home_repository.dart';

class LibraryController extends GetxController {
  static LibraryController get to => Get.find();
  Duration time = Duration(seconds: 15);

  Rx<Boxofs> boxofsBest = Boxofs().obs;
  Rx<Boxofs> boxofsOpenRun = Boxofs().obs;
  Rx<Boxofs> boxofsMusical = Boxofs().obs;
  Rx<Boxofs> boxofsTheater = Boxofs().obs;
  Rx<Boxofs> boxofsClassic = Boxofs().obs;
  Rx<Boxofs> boxofsDance = Boxofs().obs;
  Rx<Boxofs> boxofsKid = Boxofs().obs;
  Rx<Boxofs> boxofsKoreaClassic = Boxofs().obs;
  Rx<Boxofs> boxofsOpera = Boxofs().obs;

  @override
  void onInit() async {
    _numBestLoad();
    _bestOpenRunLoad();
    _bestDancelLoad();
    _bestKidLoad();
    _bestMusicalLoad();
    _bestOperaLoad();
    _bestKoreaClassicLoad();
    _bestClassicLoad();
    _bestTheaterlLoad();
    super.onInit();
  }

  void _numBestLoad() async {
    Boxofs? box = await HomeRepository.to.loadNumberBest();
    if (box != null && box.boxof != null && box.boxof!.length > 0) {
      boxofsBest(box);
    }
  }

  void _bestMusicalLoad() async {
    Boxofs? box = await HomeRepository.to.loadMusicalBest();
    if (box != null && box.boxof != null && box.boxof!.length > 0) {
      boxofsMusical(box);
    }
  }

  void _bestTheaterlLoad() async {    
    Boxofs? box = await HomeRepository.to.loadTheaterBest();
    if (box != null && box.boxof != null && box.boxof!.length > 0) {
      boxofsTheater(box);
    }
  }

  void _bestDancelLoad() async {
    Boxofs? box = await HomeRepository.to.loadDanceBest();
    if (box != null && box.boxof != null && box.boxof!.length > 0) {
      boxofsDance(box);
    }
  }

  void _bestKidLoad() async {
    Boxofs? box = await HomeRepository.to.loadKidBest();
    if (box != null && box.boxof != null && box.boxof!.length > 0) {
      boxofsKid(box);
    }
  }

  void _bestOpenRunLoad() async {
    Boxofs? box = await HomeRepository.to.loadOpenRunBest();
    if (box != null && box.boxof != null && box.boxof!.length > 0) {
      boxofsOpenRun(box);
    }
  }

  void _bestOperaLoad() async {
    Boxofs? box = await HomeRepository.to.loadOperaBest();
    if (box != null && box.boxof != null && box.boxof!.length > 0) {
      boxofsOpera(box);
    }
  }

  void _bestClassicLoad() async {
    Boxofs? box = await HomeRepository.to.loadClassicBest();
    if (box != null && box.boxof != null && box.boxof!.length > 0) {
      boxofsClassic(box);
    }
  }

  void _bestKoreaClassicLoad() async {
    Boxofs? box = await HomeRepository.to.loadKoreaClassicBest();
    if (box != null && box.boxof != null && box.boxof!.length > 0) {
      boxofsKoreaClassic(box);
    }
  }
}
