import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:musical_app/binding/initbinding.dart';
import 'package:musical_app/components/musical_detail.dart';
import 'package:musical_app/controller/detail_controller.dart';
import 'package:musical_app/controller/search_controller.dart';
import 'package:musical_app/screen/app.dart';
import 'package:musical_app/screen/login/home_login.dart';
import 'package:musical_app/screen/login/login.dart';
import 'package:musical_app/screen/search.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Musical',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
        splashColor: Colors.white,
      ),
      initialRoute: "/HomeLogin",
      initialBinding: InitBinding(),
      getPages: [
        GetPage(name: "/HomeLogin", page: () => HomeLogin()),
        GetPage(name: "/", page: () => App()),
        GetPage(
          name: "/MusicalDetail/:mt20id",
          page: () => MusicalDetail(),
          binding: BindingsBuilder(
              () => Get.lazyPut<DetailController>(() => DetailController())),
        ),
        GetPage(
          name: "/Search",
          page: () => Search(),
          binding: BindingsBuilder(
              () => Get.lazyPut<SearchController>(() => SearchController())),
        ),
        GetPage(name: "/Login", page: () => Login()),
      ],
    );
  }
}
