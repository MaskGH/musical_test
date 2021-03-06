import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:musical_app/components/musical_detail.dart';
import 'package:musical_app/model/db.dart';

class SearchResultPage extends StatelessWidget {
  Db? db;
  SearchResultPage({Key? key, this.db}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      child: Row(
        children: [
          Container(
            width: Get.width * 0.3,
            child: Image.network(
              db!.poster ?? muUrl,
              fit: BoxFit.cover,
            ),
          ),
          Flexible(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  db!.prfnm ?? "해당 정보 없음",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 20),
                  maxLines: 2,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(db!.prfpdfrom ?? "해당 정보 없음",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w500)),
                    Text(db!.fcltynm ?? "해당 정보 없음",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w500)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


