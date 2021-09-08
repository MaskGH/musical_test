import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';
import 'package:musical_app/components/musical_detail.dart';
import 'package:musical_app/controller/home_controller.dart';

class ListMore extends StatelessWidget {
  ListMore({Key? key}) : super(key: key);

  final HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Obx(
          () => CustomScrollView(
            slivers: [
              SliverAppBar(
                title: Text("뮤지컬"),
                floating: true,
                backgroundColor: Colors.yellow.shade700,
                leading: IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icon(
                    Ionicons.arrow_back_outline,
                    color: Colors.white,
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        Get.toNamed(
                            "/MusicalDetail/${homeController.dbsListResult.value.db![index].mt20id}");
                      },
                      child: Container(
                        width: Get.width,
                        height: 100,
                        child: Row(
                          children: [
                            Container(
                              width: Get.width * 0.3,
                              height: 100,
                              child: Image.network(
                                homeController.dbsListResult.value.db![index]
                                        .poster ??
                                    muUrl,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Flexible(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Text(
                                    homeController.dbsListResult.value
                                            .db![index].prfnm ??
                                        "제목 정보 없음",
                                    maxLines: 3,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                  Row(
                                    children: [
                                      Text(homeController.dbsListResult.value
                                              .db![index].prfpdto ??
                                          "날짜 정보 없음"),
                                      Text(" 까지"),
                                    ],
                                  ),
                                  Text(
                                    homeController.dbsListResult.value
                                            .db![index].fcltynm ??
                                        "장소 정보 없음",
                                    maxLines: 2,
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
                        homeController.dbsListResult.value.db?.length ?? 0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
