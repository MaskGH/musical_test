import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:musical_app/components/musical_detail.dart';
import 'package:musical_app/model/db.dart';

class SearchResultPage extends StatelessWidget {
  Db? db;
  SearchResultPage({Key? key, this.db}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 10),
      width: Get.width,
      height: 150,
      child: Row(
        children: [
          Container(
            width: Get.width * 0.4,
            child: Image.network(
              db!.poster == null ? muUrl : db!.poster!,
              fit: BoxFit.cover,
            ),
          ),
          Flexible(
            child: Column(              
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  db!.prfnm!,
                  style: GoogleFonts.sunflower(
                      fontSize: 20, fontWeight: FontWeight.bold),
                  maxLines: 2,
                ),
                Container(
                  padding: EdgeInsets.only(left: 10),                  
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        children: [
                          Text(db!.prfpdto == null
                              ? "날짜 정보 없음"
                              : db!.prfpdto!),
                          Text("  까지"),
                        ],
                      ),
                      Text(db!.fcltynm == null ? "장소 정보 없음" : db!.fcltynm!),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
