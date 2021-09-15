import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:musical_app/components/admob.dart';
import 'package:musical_app/controller/detail_controller.dart';
import 'package:musical_app/controller/person_controlller.dart';

const String muUrl =
    "http://t1.daumcdn.net/friends/prod/editor/dc8b3d02-a15a-4afa-a88b-989cf2a50476.jpg";

const String muImage = "assets/image/404.png";

class MusicalDetail extends GetView<DetailController> {
  MusicalDetail({
    Key? key,
  }) : super(key: key);
  final PersonController personController = Get.put(PersonController());

  Widget _line() {
    return Container(
      color: Colors.grey.withOpacity(0.5),
      height: 0.5,
      width: Get.width * 0.8,
    );
  }

  Widget _mainImage() {
    return Stack(
      children: [
        Container(
          alignment: Alignment.center,
          child: Image.network(
            controller.dbResult.value.poster == null
                ? muUrl
                : controller.dbResult.value.poster!,
            fit: BoxFit.fitWidth,
            width: 800,
            height: 400,
          ),
        ),
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            margin: EdgeInsets.only(top: 80),
            height: 300,
            alignment: Alignment.center,
            child: Image.network(
              controller.dbResult.value.poster == null
                  ? muUrl
                  : controller.dbResult.value.poster!,
              fit: BoxFit.fitWidth,
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Container(
              padding: EdgeInsets.all(10),
              child: Icon(
                Ionicons.chevron_back_outline,
                size: 25,
                color: Colors.yellow.shade700,
              )),
        ),
      ],
    );
  }

  Widget _mainTitle() {
    return Container(
      child: Row(
        children: [
          Container(
            width: Get.width,
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Obx(
              () => Text(
                controller.dbResult.value.prfnm == null
                    ? "제목 없음"
                    : controller.dbResult.value.prfnm!,
                maxLines: 3,
                style: GoogleFonts.sunflower(
                    fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _mainInfo() {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10, left: 10),
      child: Container(
        alignment: Alignment.centerLeft,
        child: Obx(
          () => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "공연 상태 :  ${controller.dbResult.value.prfstate == null ? "정보 없음" : controller.dbResult.value.prfstate!}",
                style: GoogleFonts.sunflower(fontSize: 18),
                maxLines: 2,
              ),
              Text(
                "공연 장소 :  ${controller.dbResult.value.fcltynm == null ? "미지정" : controller.dbResult.value.fcltynm!}",
                style: GoogleFonts.sunflower(fontSize: 18),
                maxLines: 2,
              ),
              Text(
                "관람 연령 :  ${controller.dbResult.value.prfage == null ? "전체 관람가" : controller.dbResult.value.prfage!}",
                style: GoogleFonts.sunflower(fontSize: 18),
                maxLines: 2,
              ),
              Text(
                "공연 기간 :  ${controller.dbResult.value.prfpdfrom == null ? " 미정 " : controller.dbResult.value.prfpdfrom!} ~ ${controller.dbResult.value.prfpdto == null ? "" : controller.dbResult.value.prfpdto!}",
                style: GoogleFonts.sunflower(fontSize: 18),
                maxLines: 2,
              ),
              Text(
                "공연 시간 :  ${controller.dbResult.value.dtguidance == null ? "정보 없음" : controller.dbResult.value.dtguidance!}    (런타임:${controller.dbResult.value.prfruntime == null ? "" : controller.dbResult.value.prfruntime!})",
                style: GoogleFonts.sunflower(fontSize: 18),
                maxLines: 2,
              ),
              Text(
                "가격 : ${controller.dbResult.value.pcseguidance == null ? "가격 미정" : controller.dbResult.value.pcseguidance!}",
                style: GoogleFonts.sunflower(fontSize: 18),
                maxLines: 2,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _mainDetailText() {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: Container(
        width: Get.width,
        child: Image.network(
          controller.dbResult.value.styurls?.styurl ?? muUrl,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

// controller.dbResult.value.sty == null
//             ? Center(
//                 child: Obx(
//                   () => Image.network(
//                     controller.dbResult.value.poster == null
//                         ? muUrl
//                         : controller.dbResult.value.poster!,
//                   ),
//                 ),
//               )
//             : Text(controller.dbResult.value.sty == null
//                 ? "줄거리 정보 없음 "
//                 : controller.dbResult.value.sty!),

  Widget _creatorName(String text, String creator) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 5, left: 10, right: 10),
      child: Container(
        width: Get.width,
        padding: EdgeInsets.only(top: 20, bottom: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              text,
              style: GoogleFonts.sunflower(
                  fontWeight: FontWeight.bold, fontSize: 25),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              creator,
              maxLines: 3,
              style: GoogleFonts.sunflower(
                  fontSize: 20, color: Colors.black.withOpacity(0.6)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buyButton(
    Function() ontap,
    String text,
  ) {
    return TextButton(
        onPressed: ontap,
        child: Text(
          text,
          style: TextStyle(fontSize: 18),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            width: Get.width,
            child: Obx(
              () => Column(
                children: [
                  _mainImage(),
                  _mainTitle(),
                  _line(),
                  _mainInfo(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buyButton(() {}, "에매하기"),
                      _buyButton(() {
                        personController.addCart(controller.dbResult.value);
                      }, "장바구니"),
                    ],
                  ),
                  _line(),
                  _mainDetailText(),
                  _line(),
                  _creatorName(
                      "출연진",
                      controller.dbResult.value.prfcast == null
                          ? "출연진 정보 없음"
                          : controller.dbResult.value.prfcast!),
                  _creatorName(
                      "제작진",
                      controller.dbResult.value.prfcrew == null
                          ? "제작진 정보 없음"
                          : controller.dbResult.value.prfcrew!),
                  _line(),
                  AdmobBox(),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
