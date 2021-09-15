import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:musical_app/components/search_result.dart';
import 'package:musical_app/controller/search_controller.dart';

class Search extends GetView<SearchController> {
  const Search({Key? key}) : super(key: key);

  Widget _searchHistory() {
    return ListView(
      children: List.generate(
        controller.history.length,
        (index) => ListTile(
          onTap: () {
            controller.submitSearch(controller.history[index]);
          },
          leading: Icon(
            Ionicons.time_outline,
            size: 30,
          ),
          title: Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: Text(controller.history[index]),
          ),
          trailing: Icon(
            Icons.arrow_forward_ios,
            size: 20,
          ),
        ),
      ).toList(),
    );
  }

  Widget _searchResultKopis() {
    return SingleChildScrollView(
      child: Column(
        children: List.generate(controller.dbsresult.value.db!.length, (index) {
          return GestureDetector(
            onTap: () {
              Get.toNamed(
                  "/MusicalDetail/${controller.dbsresult.value.db![index].mt20id}");
            },
            // child: HomeRecommandList(
            //   db: controller.dbsresult.value.db![index],
            // ),
            child: Card(
              margin: EdgeInsets.only(left: 10,top: 5,bottom:5,right: 10),
              elevation: 5,
              semanticContainer: true,
              shadowColor: Colors.grey.withOpacity(0.5),
              child: SearchResultPage(
                db: controller.dbsresult.value.db![index],
              ),
            ),
          );
        }),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: CupertinoTextField(
            onSubmitted: (value) {
              controller.submitSearch(value);
            },
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Ionicons.search_outline),
              color: Colors.black.withOpacity(0.8),
            )
          ],
        ),
        body: Obx(
          () => controller.dbsresult.value.db!.length > 0
              ? _searchResultKopis()
              : _searchHistory(),
        ),
      ),
    );
  }
}
