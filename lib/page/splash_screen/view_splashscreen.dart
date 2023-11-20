import 'dart:async';

import 'package:flutter/material.dart';
import 'package:test_rs_rat/page/auth/auth/view_login.dart';

import '../main_page/view_main_page.dart';



class ViewSplashScreen extends StatefulWidget {
  const ViewSplashScreen({Key? key}) : super(key: key);

  @override
  State<ViewSplashScreen> createState() => _ViewSplashScreenState();
  static pushReplacement(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => ViewSplashScreen(),
      ),
    );
  }
}

class _ViewSplashScreenState extends State<ViewSplashScreen> {
  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 3), () => routeLogin());
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: initScreen(),
      ),
    );
  }
  String DEVICE_ID = "DEVICE_ID";
  String? _token;

  routeLogin() async {
   String? token;
   //token = await getUserId() ??"undefined";
    setState(() {
      _token = token;
    });
    if (_token == null || _token == "undefined") {

      ViewLoginPage.pushReplacement(context);
    } else {
      ViewMainPage.pushReplacement(context);
    }
  }

  @override
  void initState() {
    super.initState();
    print("this splashScreen");
  }

  Widget initScreen() {
    return Container(
      child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
       Image.asset(
         "assets/images/logo.png",
          height: MediaQuery.of(context).size.height * 0.5,
         width: MediaQuery.of(context).size.width * 0.8,
       ),
      ],
    ),);
  }
}
