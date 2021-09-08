import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:musical_app/screen/login/home_login_two.dart';
import 'package:musical_app/screen/login/login.dart';

class HomeLogin extends StatelessWidget {
  HomeLogin({Key? key}) : super(key: key);

  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Login();
        }
        if (snapshot.connectionState == ConnectionState.done) {
          return HomeLoginTwo();
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
