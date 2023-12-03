import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:sba7oo/screens/5_10Screen.dart';
import 'package:sba7oo/screens/HomeScreen.dart';
import 'package:sba7oo/screens/gusse_screen.dart';
import 'package:sba7oo/screens/password.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FlutterSizer(
      builder: (context, orientation, screenType) {
        return MaterialApp(
          routes: {
            HomePage().id: (context) => HomePage(),
            FirstScreen().id: (context) => FirstScreen(),
            GuessThePlayer().id: (context) => GuessThePlayer(),
            PasswordScreen().id: (context) => PasswordScreen(),
          },
          title: 'Flutter Sizer Example',
          theme: ThemeData(
            primarySwatch: Colors.green,
          ),
          debugShowCheckedModeBanner: false,
          initialRoute: HomePage().id,
        );
      },
    );
  }
}
