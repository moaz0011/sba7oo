// ignore_for_file: must_be_immutable, unnecessary_null_comparison, library_private_types_in_public_api, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:sba7oo/controller/gussetheplayer.dart';

import '../widgets/background.dart';
import '../widgets/diolog.dart';

class GuessThePlayer extends StatefulWidget {
  String id = "GuessPage";
  GuessThePlayer({Key? key}) : super(key: key);

  @override
  _GuessThePlayerState createState() => _GuessThePlayerState();
}

class _GuessThePlayerState extends State<GuessThePlayer> {
  int indexQ = 0;
  int indexC = 0;
  int nextClue = 1;
  late List<Map<String, dynamic>> playerData = [];

  @override
  void initState() {
    super.initState();
    _loadPlayerData();
  }

  Future<void> _loadPlayerData() async {
    try {
      final data = await Gusse().getData();
      setState(() {
        playerData = data;
      });
    } catch (error) {
      // Handle errors here
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BackGround(),
          playerData.isEmpty
              ? const Center(child: CircularProgressIndicator())
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 100.w,
                    ),
                    Container(
                      width: 90.w,
                      height: 40.h,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: ListView(
                        children: [
                          for (int i = 0; i < indexC; i++)
                            Text(
                              indexC == 0
                                  ? 'start'
                                  : (playerData == null)
                                      ? const CircularProgressIndicator
                                          .adaptive()
                                      : playerData[indexQ]['clue'][i],
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 25.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                        ],
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (indexC == playerData[indexQ]['clue'].length) {
                          String playerName=playerData[indexQ]['playerName'];
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return CustomDialog(
                                title: 'sba7o',
                                content: playerName,
                              );
                            },
                          );
                          indexC = 0;
                          nextClue = 1;
                          indexQ == 1 ? indexQ = 0 : indexQ++;
                        } else {
                          indexC++;
                          nextClue++;
                        }
                        setState(() {});
                      },
                      child: Text(
                        indexC == playerData[indexQ]['clue'].length
                            ? 'show me the player'
                            : 'show clue number $nextClue',
                      ),
                    ),
                  ],
                ),
        ],
      ),
    );
  }
}
