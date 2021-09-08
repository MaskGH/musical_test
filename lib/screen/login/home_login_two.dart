import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:musical_app/screen/app.dart';
import 'package:musical_app/screen/home.dart';
import 'package:musical_app/screen/login/login.dart';

class HomeLoginTwo extends StatelessWidget {
  HomeLoginTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
        if (!snapshot.hasData) {
          return Login();
        } else {
          return App();
        }
      },
    );
  }
}
