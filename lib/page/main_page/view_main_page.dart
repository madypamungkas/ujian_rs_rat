import 'package:flutter/material.dart';

class ViewMainPage extends StatefulWidget {
  const ViewMainPage({Key? key}) : super(key: key);

  @override
  State<ViewMainPage> createState() => _ViewMainPageState();
  static push(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => ViewMainPage(),
      ),
    );
  } static pushReplacement(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => ViewMainPage(),
      ),
    );
  }
}

class _ViewMainPageState extends State<ViewMainPage> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
