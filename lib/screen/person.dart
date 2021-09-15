import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:musical_app/components/musical_detail.dart';
import 'package:musical_app/controller/person_controlller.dart';

class Person extends StatelessWidget {
  Person({
    Key? key,
  }) : super(key: key);
  final PersonController personController = Get.find();

  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          body: NestedScrollView(
            headerSliverBuilder: (context, index) {
              return [
                SliverAppBar(
                  backgroundColor: Colors.white,
                  elevation: 1,
                  flexibleSpace: FlexibleSpaceBar(
                    centerTitle: true,
                    title: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundImage: NetworkImage(
                                _auth.currentUser!.photoURL ?? muUrl),
                          ),
                          Text(
                            _auth.currentUser!.email ?? "not email",
                            style: TextStyle(color: Colors.black),
                          ),
                          TextButton(
                            onPressed: () {
                              FirebaseAuth.instance.signOut();
                            },
                            child: Text("로그아웃"),
                          ),
                        ],
                      ),
                    ),
                  ),
                  bottom: TabBar(
                    labelColor: Colors.black.withOpacity(0.7),
                    tabs: [
                      Tab(
                        iconMargin: EdgeInsets.only(top: 30),
                        text: "결제내역",
                        icon: Icon(
                          Ionicons.receipt_outline,
                          color: Colors.black,
                        ),
                      ),
                      Tab(
                        iconMargin: EdgeInsets.only(top: 30),
                        text: "장바구니",
                        icon: Icon(
                          Ionicons.bag_outline,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ];
            },
            body: TabBarView(
              children: [
                ListView.builder(
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {},
                        child: Container(
                          width: Get.width,
                          height: 100,
                          child: Row(
                            children: [
                              Container(
                                width: Get.width * 0.3,
                                height: 100,
                                child: Image.network(
                                  muUrl,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Flexible(
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Text(
                                      "제목 정보 없음",
                                      maxLines: 3,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                    Row(
                                      children: [
                                        Text("날짜 정보 없음"),
                                        Text(" 까지"),
                                      ],
                                    ),
                                    Text(
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
                  itemCount: 5,
                ),
                ListView.builder(
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {},
                        child: Container(                          
                          width: Get.width,
                          height: 100,
                          child: Row(
                            children: [
                              Container(
                                width: Get.width * 0.3,
                                height: 100,
                                child: Image.network(
                                  personController.list[index].poster ?? muUrl,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Flexible(
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Text(
                                      personController.list[index].prfnm ??
                                          "제목 정보 없음",
                                      maxLines: 3,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                    Row(
                                      children: [
                                        Text(personController
                                                .list[index].prfpdto ??
                                            "날짜 정보 없음"),
                                        Text(" 까지"),
                                      ],
                                    ),
                                    Text(
                                      personController.list[index].fcltynm ??
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
                  itemCount: personController.list.length,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
