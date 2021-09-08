import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdmobBox extends StatelessWidget {
  const AdmobBox({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: 200,
      color: Colors.grey.withOpacity(0.1),
    );
  }
}