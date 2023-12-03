// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:sba7oo/screens/gusse_screen.dart';
import 'package:sba7oo/screens/password.dart';

import '../widgets/background.dart';
import '../widgets/myContiner.dart';
import '5_10Screen.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  String id = "HomePgae";
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          const BackGround(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 100.w,
              ),
              MyButtom(
                  name: "Gusse the player",
                  imamgePath: 'assets/gusse.jpg',
                  route: GuessThePlayer().id),
              MyButtom(
                  name: "Password challenge",
                  imamgePath: 'assets/password.jpg',
                  route: PasswordScreen().id),
              MyButtom(
                  name: "5*10",
                  imamgePath: 'assets/timer.jpg',
                  route: FirstScreen().id),
            ],
          )
        ],
      ),
    );
  }
}
