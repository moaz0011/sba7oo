import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';

class BackGround extends StatelessWidget {
  const BackGround({super.key});

  @override
  Widget build(BuildContext context) {
    return           SizedBox(
      height: 100.h,
      child: Image.asset(
              "assets/stadium.jpg",
              width: double.infinity,
              fit: BoxFit.cover,
            ),
    );
  }
}