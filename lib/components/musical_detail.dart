import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:musical_app/components/admob.dart';
import 'package:musical_app/controller/detail_controller.dart';

const String muUrl =
    "http://t1.daumcdn.net/friends/prod/editor/dc8b3d02-a15a-4afa-a88b-989cf2a50476.jpg";

class MusicalDetail extends GetView<DetailController> {
  MusicalDetail({
    Key? key,
  }) : super(key: key);

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
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        width: Get.width,
        child: controller.dbResult.value.sty == null
            ? Center(
                child: Obx(
                  () => Image.network(
                    controller.dbResult.value.poster == null
                        ? muUrl
                        : controller.dbResult.value.poster!,
                  ),
                ),
              )
            : Text(controller.dbResult.value.sty == null
                ? "줄거리 정보 없음 "
                : controller.dbResult.value.sty!),
      ),
    );
  }

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

  Widget _buyButton() {
    return GestureDetector(
      onTap: () {
        print("결제결제");
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20),
              topLeft: Radius.circular(20),
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20)),
          color: Colors.grey,
        ),
        width: Get.width * 0.8,
        height: 80,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                padding: EdgeInsets.only(right: 10),
                child: Icon(
                  Ionicons.ticket_outline,
                  size: 30,
                  color: Colors.white70,
                )),
            Container(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                "예매하기",
                style: GoogleFonts.sunflower(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Colors.white70),
              ),
            )
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
          child: Container(
            width: Get.width,
            child: Obx(
              () => Column(
                children: [
                  _mainImage(),
                  _mainTitle(),
                  _line(),
                  _mainInfo(),
                  _buyButton(),
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
