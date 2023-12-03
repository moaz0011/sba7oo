import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';

import '../controller/paswword.dart';
import '../widgets/background.dart';

// ignore: must_be_immutable
class PasswordScreen extends StatefulWidget {
  String id = "passwordPage";
  PasswordScreen({super.key});

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

int index = 0;
List<dynamic> data = [];
bool isLoading = true;

class _PasswordScreenState extends State<PasswordScreen> {
  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  // Define a function to fetch the data
  Future<void> _fetchData() async {
    try {
      data = await Password().getdata();
      setState(() {
        isLoading = false;
      });
    } catch (error) {
      // Handle any errors here
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BackGround(),
          if (isLoading)
            const Center(
              child: CircularProgressIndicator.adaptive(),
            )
          else
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 100.w,
                ),
                Text(
                  data[index]['playerName'],
                  style: TextStyle(
                    // ignore: deprecated_member_use
                    fontSize: 30.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white, // Text color on top of the image
                  ),
                ),
                Image.network(
                  data[index]['imageURL'],
                  width: 80.w,
                 height: 40.h,
                 fit: BoxFit.cover,
                ),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        if (index == data.length - 1) {
                          index = 0;
                        } else {
                          index++;
                        }
                      });
                    },
                    child: Text(
                      'change',
                      style: TextStyle(
                        // ignore: deprecated_member_use
                        fontSize: 25.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white, // Text color on top of the image
                      ),
                    ))
              ],
            ),
        ],
      ),
    );
  }
}
