import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:ionicons/ionicons.dart';
import 'package:musical_app/controller/app_controller.dart';
import 'package:musical_app/screen/home.dart';
import 'package:musical_app/screen/library.dart';
import 'package:musical_app/screen/person.dart';
import 'package:musical_app/screen/search.dart';

class App extends GetView<AppController> {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        switch (RouteName.values[controller.currentIndex.value]) {
          case RouteName.Home:
            return Home();
            break;
          case RouteName.Search:
            return Search();
            break;
          case RouteName.Library:
            return Library();
            break;
          case RouteName.Person:
            return Person();
            break;
        }
        return Container();
      }),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          onTap: controller.changeCurrentIndex,
          currentIndex: controller.currentIndex.value,
          fixedColor: Colors.yellow.shade700,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          unselectedFontSize: 0.0,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Ionicons.home_outline),
              activeIcon: Icon(Ionicons.home_sharp),
              label: "Home",
            ),
            BottomNavigationBarItem(
                icon: Icon(Ionicons.search_outline),
                activeIcon: Icon(Ionicons.search_sharp),
                label: "Search"),
            BottomNavigationBarItem(
                icon: Icon(Ionicons.library_outline),
                activeIcon: Icon(Ionicons.library_sharp),
                label: "Library"),
            BottomNavigationBarItem(
                icon: Icon(Ionicons.person_outline),
                activeIcon: Icon(Ionicons.person_sharp),
                label: "Person"),
          ],
        ),
      ),
    );
  }
}
