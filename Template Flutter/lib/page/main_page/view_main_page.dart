import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:test_rs_rat/page/auth/view_login.dart';

import '../../common/view_component/gap.dart';
import '../../common/view_component/sis_buttons.dart';
import '../../common/view_component/sis_color.dart';
import '../../common/view_component/sis_texts.dart';

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
    var size = MediaQuery.of(context).size;
    return Container(child:  SafeArea(child:
    Scaffold(
      appBar: AppBar(title: Text14SpBold(
        text: "Test RS RAT",
        color: Colors.white,
      ),),
      body: Container(
        color: Colors.white,
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.only(left: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(width: size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GapV(30),
                  Container(
                    padding: EdgeInsets.all(10),
                    width: size.width *0.3,
                    child: Center(
                      child: CachedNetworkImage(
                        imageUrl:  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTtc5nZPiS-0IAdklrzZA9BGdpXIkulOtuceQ&usqp=CAU",
                        fit: BoxFit.cover,
                        height: size.height * 0.1,
                        width: size.width * 0.5,
                        progressIndicatorBuilder: (context, url, downloadProgress) =>SizedBox(child:
                        CircularProgressIndicator(value: downloadProgress.progress), height: 100, width: 100,),
                        errorWidget: (context, url, error) => Icon(Icons.person),
                      ),
                    ),
                  ),
                  GapH(10),
                  Container(
                    width: size.width *0.6,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text14SpBold(text: "Profil", maxLines: 2, textAlign: TextAlign.center,),
                        GapV(10),

                      ],),
                  ),
                ],),
            ),

            GapV(5),
            Text12SpMedium(text: "Nama User"),
            SisBoxContainer(childWidget:Text12SpMedium(text: "", maxLines: 5,),),
            GapV(5),
            Text12SpMedium(text: "Email"),
            SisBoxContainer(childWidget:Text12SpMedium(text: "", maxLines: 5,),),
            GapV(5),
            Text12SpMedium(text: "NO Hp"),
            SisBoxContainer(childWidget:Text12SpMedium(text: "", maxLines: 5,),),
            GapV(5),
            Text12SpMedium(text: 'Asal Faskes'),
            SisBoxContainer(childWidget:Text12SpMedium(text:  "", maxLines: 5,),),
            GapV(5),
            Text12SpMedium(text: 'Alamat Faskes'),
            SisBoxContainer(childWidget:Text12SpMedium(text:"" , maxLines: 5,),),
            GapV(5),
            Text12SpMedium(text: 'No Telp'),
            SisBoxContainer(childWidget:Text12SpMedium(text:  "", maxLines: 5,),),
            GapV(5),
            Text12SpMedium(text: 'longitude'),
            SisBoxContainer(childWidget:Text12SpMedium(text: "", maxLines: 5,),),
            Text12SpMedium(text: 'latitude'),
            SisBoxContainer(childWidget:Text12SpMedium(text: "", maxLines: 5,),),
            GapV(30),
            Center(child:
            Container(
              width: size.width *0.5,
              child: SisButtonRounded(text: "Logout", onTap: (){
                ViewLoginPage.pushReplacement(context);
              },
                color: SisColor.mainColorGreen,
                textColor: Colors.white,
                padding: EdgeInsets.symmetric(vertical: 10),
                isLoading:false,),
            ),),
          ],),),)), color: Colors.white,);
  }
}
