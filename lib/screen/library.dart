import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:musical_app/components/library_widget.dart';
import 'package:musical_app/controller/library_controller.dart';

class News extends StatelessWidget {
  News({Key? key}) : super(key: key);
  LibraryController controller = Get.put(LibraryController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 7,
        child: Scaffold(
          body: NestedScrollView(
            headerSliverBuilder: (context, index) {
              return [
                SliverAppBar(
                  floating: true,
                  snap: true,
                  elevation: 1,
                  backgroundColor: Colors.white,
                  flexibleSpace: FlexibleSpaceBar(
                    centerTitle: true,
                  ),
                  title: Center(
                    child: Text(
                      "장르별",
                      style: TextStyle(color: Colors.black.withOpacity(0.8)),
                    ),
                  ),
                  actions: [
                    IconButton(
                        onPressed: () {
                          Get.reloadAll();
                        },
                        icon: Icon(
                          Ionicons.refresh_outline,
                          size: 25,
                          color: Colors.black,
                        )),
                  ],
                  bottom: TabBar(
                    labelColor: Colors.black.withOpacity(0.7),
                    indicatorColor: Colors.yellow.shade700,
                    labelStyle:
                        TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
                    indicatorSize: TabBarIndicatorSize.label,
                    tabs: [
                      Tab(
                        text: "순위",
                      ),
                      Tab(
                        text: "오픈런",
                      ),
                      Tab(
                        text: "뮤지컬",
                      ),
                      Tab(
                        text: "연극",
                      ),
                      Tab(
                        text: "클/오",
                      ),
                      Tab(
                        text: "무용",
                      ),
                      Tab(
                        text: "아동",
                      ),
                    ],
                  ),
                ),
              ];
            },
            body: TabBarView(
              children: [
                Obx(
                  // 순위
                  () => ListView.builder(
                    itemCount: controller.boxofsBest.value.boxof?.length ?? 0,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {},
                        child: Card(
                          margin: EdgeInsets.only(
                              top: 5, bottom: 5, left: 15, right: 15),
                          semanticContainer: true,
                          elevation: 5,
                          shadowColor: Colors.grey.withOpacity(0.5),
                          child: Padding(
                            padding: EdgeInsets.only(
                                top: 5, left: 5, right: 5, bottom: 5),
                            child: LibararyWidget(
                              boxof: controller.boxofsBest.value.boxof![index],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Obx(
                  // 오픈런
                  () => ListView.builder(
                    itemCount:
                        controller.boxofsOpenRun.value.boxof?.length ?? 0,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {},
                        child: Card(
                          margin: EdgeInsets.only(
                              top: 5, bottom: 5, left: 15, right: 15),
                          semanticContainer: true,
                          elevation: 5,
                          shadowColor: Colors.grey.withOpacity(0.5),
                          child: Padding(
                            padding: EdgeInsets.only(
                                top: 5, left: 5, right: 5, bottom: 5),
                            child: LibararyWidget(
                              boxof:
                                  controller.boxofsOpenRun.value.boxof![index],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Obx(
                  // 뮤지컬
                  () => ListView.builder(
                    itemCount:
                        controller.boxofsMusical.value.boxof?.length ?? 0,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {},
                        child: Card(
                          margin: EdgeInsets.only(
                              top: 5, bottom: 5, left: 15, right: 15),
                          semanticContainer: true,
                          elevation: 5,
                          shadowColor: Colors.grey.withOpacity(0.5),
                          child: Padding(
                            padding: EdgeInsets.only(
                                top: 5, left: 5, right: 5, bottom: 5),
                            child: LibararyWidget(
                              boxof:
                                  controller.boxofsMusical.value.boxof![index],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Obx(
                  // 연극
                  () => ListView.builder(
                    itemCount:
                        controller.boxofsTheater.value.boxof?.length ?? 0,
                    itemBuilder: (context, index) {                      
                      return GestureDetector(
                        onTap: () {},
                        child: Card(
                          margin: EdgeInsets.only(
                              top: 5, bottom: 5, left: 15, right: 15),
                          semanticContainer: true,
                          elevation: 5,
                          shadowColor: Colors.grey.withOpacity(0.5),
                          child: Padding(
                            padding: EdgeInsets.only(
                                top: 5, left: 5, right: 5, bottom: 5),
                            child: LibararyWidget(
                              boxof:
                                  controller.boxofsTheater.value.boxof![index],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Obx(
                  // 클래식 오페라
                  () => ListView.builder(                    
                    itemCount:
                        controller.boxofsClassic.value.boxof?.length ?? 0,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {},
                        child: Card(
                          margin: EdgeInsets.only(
                              top: 5, bottom: 5, left: 15, right: 15),
                          semanticContainer: true,
                          elevation: 5,
                          shadowColor: Colors.grey.withOpacity(0.5),
                          child: Padding(
                            padding: EdgeInsets.only(
                                top: 5, left: 5, right: 5, bottom: 5),
                            child: LibararyWidget(
                              boxof:
                                  controller.boxofsClassic.value.boxof![index],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Obx(
                  // 무용
                  () => ListView.builder(
                    itemCount: controller.boxofsDance.value.boxof?.length ?? 0,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {},
                        child: Card(
                          margin: EdgeInsets.only(
                              top: 5, bottom: 5, left: 15, right: 15),
                          semanticContainer: true,
                          elevation: 5,
                          shadowColor: Colors.grey.withOpacity(0.5),
                          child: Padding(
                            padding: EdgeInsets.only(
                                top: 5, left: 5, right: 5, bottom: 5),
                            child: LibararyWidget(
                              boxof: controller.boxofsDance.value.boxof![index],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Obx(
                  // 아동
                  () => ListView.builder(
                    itemCount: controller.boxofsKid.value.boxof?.length ?? 0,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {},
                        child: Card(
                          margin: EdgeInsets.only(
                              top: 5, bottom: 5, left: 15, right: 15),
                          semanticContainer: true,
                          elevation: 5,
                          shadowColor: Colors.grey.withOpacity(0.5),
                          child: Padding(
                            padding: EdgeInsets.only(
                                top: 5, left: 5, right: 5, bottom: 5),
                            child: LibararyWidget(
                              boxof: controller.boxofsKid.value.boxof![index],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
