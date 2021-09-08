import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';
import 'package:musical_app/components/admob.dart';
import 'package:musical_app/components/eventlist_widget.dart';
import 'package:musical_app/components/kopisreader.dart';
import 'package:musical_app/components/listmore.dart';
import 'package:musical_app/components/musical_detail.dart';
import 'package:musical_app/components/musical_widget.dart';
import 'package:musical_app/components/theater_list_more.dart';
import 'package:musical_app/components/theater_widget.dart';
import 'package:musical_app/controller/home_controller.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);
  final HomeController controller = Get.put(HomeController());

  Widget _MainImageSlider() {
    return Container(
      child: Obx(
        () => CarouselSlider.builder(
          itemCount: controller.dbsListResult.value.db?.length ?? 0,
          itemBuilder: (context, index, realIndex) {
            return GestureDetector(
              onTap: () {
                Get.toNamed(
                    "/MusicalDetail/${controller.dbsListResult.value.db![index].mt20id}");
              },
              child: Container(
                width: Get.width,
                child: Image.network(
                    controller.dbsListResult.value.db?[index].poster == null
                        ? muUrl
                        : controller.dbsListResult.value.db![index].poster!),
              ),
            );
          },
          options: CarouselOptions(
            height: 300,
            initialPage: 0,
            enableInfiniteScroll: true,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 2),
            autoPlayAnimationDuration: Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: true,
            scrollDirection: Axis.horizontal,
          ),
        ),
      ),
    );
  }

  Widget _ListButton(Function()? ontap, String text) {
    FirebaseAuth.instance.authStateChanges();
    return GestureDetector(
      onTap: ontap,
      child: Container(
        padding: EdgeInsets.only(
          left: 15,
          right: 15,
        ),
        width: Get.width,
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: GoogleFonts.sunflower(
                  fontSize: 15, fontWeight: FontWeight.bold),
            ),
            Container(
              child: Row(
                children: [
                  Text(
                    "전체보기",
                    style: TextStyle(color: Colors.grey.withOpacity(0.8)),
                  ),
                  Icon(
                    Ionicons.chevron_forward_outline,
                    color: Colors.grey.withOpacity(0.8),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              _MainImageSlider(),
              SizedBox(
                height: 20,
              ),
              _ListButton(() {
                Get.to(() => ListMore());
              }, "뮤지컬"),
              Container(
                width: Get.width,
                height: 300,
                child: Obx(
                  () => CustomScrollView(
                    scrollDirection: Axis.horizontal,
                    slivers: [
                      SliverList(
                        delegate: SliverChildBuilderDelegate((context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(
                                top: 10, bottom: 10, left: 15, right: 15),
                            child: GestureDetector(
                              onTap: () {
                                Get.toNamed(
                                    "/MusicalDetail/${controller.dbsListResult.value.db![index].mt20id}");
                              },
                              child: HomeRecommandList(
                                db: controller.dbsListResult.value.db![index],
                              ),
                            ),
                          );
                        },
                            childCount:
                                controller.dbsListResult.value.db?.length ?? 0),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              _ListButton(() => {Get.to(() => TheaterListMore())}, "연극"),
              Container(
                width: Get.width,
                height: 260,
                child: Obx(
                  () => CustomScrollView(
                    scrollDirection: Axis.horizontal,
                    slivers: [
                      SliverList(
                        delegate: SliverChildBuilderDelegate((context, index) {
                          return Padding(
                            padding: EdgeInsets.only(
                                top: 10, bottom: 10, left: 15, right: 15),
                            child: GestureDetector(
                              onTap: () {
                                Get.toNamed(
                                    "/MusicalDetail/${controller.dbsTheaterResult.value.db![index].mt20id}");
                              },
                              child: TheaterList(
                                db: controller
                                    .dbsTheaterResult.value.db![index],
                              ),
                            ),
                          );
                        },
                            childCount:
                                controller.dbsTheaterResult.value.db?.length ??
                                    0),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              AdmobBox(),
              SizedBox(
                height: 20,
              ),
              _ListButton(() => {print("go Page event")}, "이벤트"),
              EventList(),
              KopisReader(),
            ],
          ),
        ),
      ),
    );
  }
}
