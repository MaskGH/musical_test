import 'package:flutter/material.dart';
import 'package:get/get.dart';

class KopisReader extends StatelessWidget {
  const KopisReader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width * 0.8,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("이 서비스는 KOPIS에 의거하여 개발된 서비스입니다. \n",),
          Text("출처 : (재)예술경영지원센터 공연예술통합전산망(www.kopis.or.kr)"),
          Text("집계기간 : 최종집계 2021.08.01 ~ 2022.01.01"),
          Text("집계대상 : 모든 공연 데이터 전송기관"),
          Text(
              "집계 데이터는 공연예술통합전산망 연계기관의 티켓판매시스템에서 발권된 분량을 기준으로 제공함으로 해당 공연의 전체 관객 수와 차이가 있을 수 있습니다."),
        ],
      ),
    );
  }
}
