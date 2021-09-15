import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:musical_app/components/musical_detail.dart';
import 'package:musical_app/model/db.dart';

class LibararyWidget extends StatelessWidget {
  Boxof? boxof;

  LibararyWidget({
    Key? key,
    this.boxof,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed("/MusicalDetail/${boxof!.mt20id!}");
      },
      child: Container(
        width: Get.width,
        child: Row(
          children: [
            Container(
              width: Get.width * 0.3,
              child: Image.network(
                "http://www.kopis.or.kr${boxof!.poster ?? muUrl}",
                fit: BoxFit.cover,
              ),
            ),
            Flexible(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    boxof!.prfnm ?? "해당 정보 없음",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        fontSize: 20),
                    maxLines: 2,
                  ),
                  Column(
                    children: [
                      Text(boxof!.prfpd ?? "해당 정보 없음"),
                      Text(boxof!.prfplcnm ?? "해당 정보 없음"),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
