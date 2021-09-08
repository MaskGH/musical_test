import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:ionicons/ionicons.dart';
import 'package:musical_app/screen/app.dart';

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);

  final _auth = FirebaseAuth.instance;
  late String email;
  late String password;

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  Widget _loginTitle() {
    return Expanded(
      flex: 1,
      child: Container(
        padding: EdgeInsets.only(left: 40, top: 50),
        alignment: Alignment.centerRight,
        child: Row(
          children: [
            Text(
              "보",
              style: GoogleFonts.sunflower(
                fontSize: 50,
                fontWeight: FontWeight.bold,
                color: Colors.lightGreen.shade500,
              ),
            ),
            Text(
              "러가",
              style: GoogleFonts.sunflower(
                  fontSize: 50, color: Colors.white.withOpacity(1)),
            ),
            Text(
              "자  ",
              style: GoogleFonts.sunflower(
                fontSize: 50,
                fontWeight: FontWeight.bold,
                color: Colors.lightGreen.shade500,
              ),
            ),
            DefaultTextStyle(
              style: GoogleFonts.sunflower(
                  fontSize: 50, color: Colors.black.withOpacity(0.8)),
              child: AnimatedTextKit(
                repeatForever: true,
                animatedTexts: [
                  RotateAnimatedText("뮤지컬"),
                  RotateAnimatedText("연극"),
                  RotateAnimatedText("오페라"),
                  RotateAnimatedText("축제"),
                ],
                isRepeatingAnimation: true,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _loginTextForm() {
    return Expanded(
      flex: 3,
      child: Container(
        width: Get.width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50),
            topRight: Radius.circular(50),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 70, left: 20, right: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextField(
                onChanged: (value) {
                  email = value;
                },
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.yellow.shade700,
                  hintText: "E-mail",
                  hintStyle: TextStyle(color: Colors.white),
                  prefixIcon: Icon(
                    Ionicons.mail_outline,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                onChanged: (value) {
                  password = value;
                },
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.yellow.shade700,
                  hintText: "Password",
                  hintStyle: TextStyle(color: Colors.white),
                  prefixIcon: Icon(
                    Ionicons.key_outline,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: Get.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      child: Row(
                        children: [
                          TextButton(
                            onPressed: () async {
                              try {
                                final havyUser =
                                    await _auth.signInWithEmailAndPassword(
                                        email: email, password: password);
                                if (havyUser != null) {
                                  await Get.to(App());
                                }
                              } catch (e) {
                                print(e);
                              }
                            },
                            child: Padding(
                              padding: EdgeInsets.all(10),
                              child: Text("로그인"),
                            ),
                          ),
                          TextButton(
                            onPressed: () async {
                              try {
                                final newUser =
                                    await _auth.createUserWithEmailAndPassword(
                                        email: email, password: password);
                                if (newUser != null) {
                                  await Get.to(App());
                                }
                              } catch (e) {
                                print(e);
                              }
                            },
                            child: Padding(
                              padding: EdgeInsets.all(10),
                              child: Text("회원가입"),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                        alignment: Alignment.topRight,
                        child: TextButton(
                            onPressed: () {}, child: Text("비밀번호 찾기"))),
                  ],
                ),
              ),
              _loginForWith(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _loginForWith() {
    return Container(
      width: Get.width,
      child: Column(
        children: [
          Container(
            width: Get.width,
            child: ElevatedButton.icon(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.white),
                elevation: MaterialStateProperty.all(5),
              ),
              onPressed: signInWithGoogle,
              icon: Icon(
                Ionicons.logo_google,
                color: Colors.black.withOpacity(0.8),
              ),
              label: Text(
                "Google 로그인",
                style: TextStyle(color: Colors.black.withOpacity(0.7)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.yellowAccent.shade100, Colors.yellow.shade700],
            begin: Alignment.centerLeft,
            end: Alignment.topRight,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _loginTitle(),
            _loginTextForm(),
          ],
        ),
      ),
    );
  }
}
