// ignore: file_names
// ignore_for_file: deprecated_member_use, must_be_immutable, unnecessary_const, unused_field, file_names, duplicate_ignore, non_constant_identifier_names
import 'dart:async' show Timer;
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:sba7oo/controller/5_10.dart';
import '../widgets/background.dart';

class FirstScreen extends StatefulWidget {
  String id = "First5*10";
  FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  int index = -1;

  List<String> Clues = [];
  int _start = 10;

  Timer? _timer;

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    // ignore: unnecessary_new
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            AssetsAudioPlayer.newPlayer()
                .open(Audio("assets/sound/timeout.mp3"));
            timer.cancel();
            _start = 10;
          });
        } else {
          setState(() {
            _start = _start - 1;
          });
        }
      },
    );
  }
// ignore: non_constant_identifier_names

  @override
  void initState() {
    super.initState();
    fetchData(); // Start fetching the data
  }

  Future<void> fetchData() async {
    Clues = await Speed().getdata(); // Wait for the data to be fetched
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          const BackGround(),
          if (Clues.isEmpty)
            const Center(child: CircularProgressIndicator.adaptive())
          else
            Column(
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
                      borderRadius: BorderRadius.circular(50)),
                  child: Center(
                    child: StatefulBuilder(
                      builder: (context, setState) => 
                       Center(
                          child: Text(index == -1 ? 'choose one' : Clues[index],
                                    textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black,
            // ignore: deprecated_member_use
            fontSize: 25.sp,
            fontWeight: FontWeight.bold,
          ),
                          )
                        ),
                    )
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      if (index == 3) {
                        index = 0;
                        setState(() {});
                      } else {
                        index++;
                        setState(() {});
                      }
                      setState(() {});
                    },
                    child: const Text("choose one")),
                SizedBox(
                  height: 1.h,
                ),
                ElevatedButton(
                    onPressed: () {
                      startTimer();
                      setState(() {
                        
                      });
                    },
                    child: const Text("Start Count")),
                SizedBox(
                  height: 12.h,
                  width: 17.w,
                  child:  CircularProgressIndicator(
                    value: _start*0.1,
                    backgroundColor: Colors.grey,
                    valueColor: const AlwaysStoppedAnimation<Color>(Colors.green),
                    strokeWidth: 5,
                  ),
                ),

                Text(
                  '$_start',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25.sp,
                      fontWeight: FontWeight.bold),
                ),
              ],
            )
        ],
      ),
    );
  }
}
