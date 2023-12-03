// ignore_for_file: file_names, deprecated_member_use, unused_import

import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import '../screens/5_10Screen.dart';

// ignore: must_be_immutable
class MyButtom extends StatelessWidget {
  String name;
  String imamgePath;
  String route;
   MyButtom({super.key,required this.name, required this.imamgePath,required this.route});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context,route);
      },
      child: 
      Padding(
        padding:  EdgeInsets.symmetric(
          vertical: 2.h
        ),
        child: Container(
          width: 90.w,
          height: 12.h,
            decoration:  BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              image:  DecorationImage(
                image: AssetImage(imamgePath), // Replace with your image asset path
                fit: BoxFit.cover, // You can adjust the fit to cover, contain, etc.
              ),
            ),
            child: Center(
              child: Text(
                name,
                style:  TextStyle(
                  fontSize: 30.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.white, // Text color on top of the image
                ),
              ),
            ),
        ),
      )
    );
  }
}