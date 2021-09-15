import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:musical_app/components/musical_detail.dart';
import 'package:musical_app/controller/home_controller.dart';

class TheaterListMore extends StatelessWidget {
  TheaterListMore({Key? key}) : super(key: key);

  final HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Obx(
          () => CustomScrollView(
            slivers: [
              SliverAppBar(
                title: Text(
                  "현재 공연중인 연극",
                  style: TextStyle(color: Colors.black),
                ),
                floating: true,
                backgroundColor: Colors.white,
                leading: IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icon(
                    Ionicons.arrow_back_outline,
                    color: Colors.black,
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
                  return GestureDetector(
                    onTap: () {
                      Get.toNamed(
                          "/MusicalDetail/${homeController.dbsTheaterResult.value.db![index].mt20id}");
                    },
                    child: Card(
                      elevation: 5,
                      shadowColor: Colors.grey.withOpacity(0.5),
                      semanticContainer: true,
                      margin: EdgeInsets.only(
                          left: 10, right: 10, top: 5, bottom: 5),
                      child: Container(
                        width: Get.width,
                        child: Row(
                          children: [
                            Container(
                              width: Get.width * 0.3,
                              child: Image.network(
                                homeController.dbsTheaterResult.value.db![index]
                                        .poster ??
                                    muUrl,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Flexible(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    homeController.dbsTheaterResult.value
                                            .db![index].prfnm ??
                                        "해당 정보 없음",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 20),
                                    maxLines: 2,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                          homeController.dbsTheaterResult.value
                                                  .db![index].prfpdfrom ??
                                              "해당 정보 없음",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w500)),
                                      Text(
                                          homeController.dbsTheaterResult.value
                                                  .db![index].fcltynm ??
                                              "해당 정보 없음",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w500)),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                    childCount:
                        homeController.dbsTheaterResult.value.db?.length ?? 0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
