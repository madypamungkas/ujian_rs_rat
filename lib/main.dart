
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:test_rs_rat/page/splash_screen/view_splashscreen.dart';






void main() async {
  WidgetsFlutterBinding.ensureInitialized();
 // await Firebase.initializeApp();
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '',
      theme: ThemeData(
        primarySwatch: MaterialColor(0xff539165,
            {
              50:  Color(0xff00C4FF),
              100: Color(0xff00C4FF),
              200: Color(0xff00C4FF),
              300: Color(0xff00C4FF),
              400: Color(0xff00C4FF),
              500: Color(0xff00C4FF),
              600: Color(0xff00C4FF),
              700: Color(0xff00C4FF),
              800: Color(0xff00C4FF),
              900: Color(0xff00C4FF),
            }),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      home:  ViewSplashScreen(),
    );
  }
}
