import 'package:flutter/material.dart';
import 'package:test_rs_rat/common/view_component/sis_buttons.dart';
import 'package:test_rs_rat/common/view_component/sis_color.dart';
import 'package:test_rs_rat/common/view_component/sis_texts.dart';

//import 'package:flutter_screenutil/flutter_screenutil.dart';


import 'gap.dart';

class SisAppBarCommonMenu extends StatelessWidget {
  final Function onTap;
  final Function onTapSecondary;
  const SisAppBarCommonMenu({Key? key, required this.onTap, required this.onTapSecondary}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.25,
      child: Column(children: [
        GapV(5),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GapH(10),
                Container( child:
                SisButtonLeadIconRounded(
                  icon: Icons.arrow_back_ios_rounded,
                  onTap: () {onTap();},
                  size: 22,
                  textColor: SisColor.mainColor,
                  color: SisColor.white,//.withOpacity(0.6),
                  width: MediaQuery.of(context).size.width * 0.1,
                ),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 20.0,
                            //color: SisColor.grey.withOpacity(0.9),
                            color: Colors.grey,
                            offset: Offset(0, 5)),
                      ],
                      borderRadius: BorderRadius.circular(10.0),)),
                GapH(10),
                Image.asset(
                  "SisruteImages.logoApp()",
                  width: MediaQuery.of(context).size.width * 0.3,
                ),
              ],),
            Padding(
                padding: EdgeInsets.only(right: 25),
                child:
            Container(child: SisButtonLeadIconRounded(
              icon: Icons.shopping_cart,
              onTap: () {onTap();},
              size: 22,
              textColor: SisColor.mainColorLight,
              color: SisColor.white,//.withOpacity(0.6),
              width: MediaQuery.of(context).size.width * 0.1,
            ),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 20.0,
                        //color: SisColor.cyanKemkes.withOpacity(0.6),
                        color: Colors.grey,
                        offset: Offset(0, 5)),
                  ],
                  borderRadius: BorderRadius.circular(20.0),)))
          ],)
      ],),
    );
  }
}

class SisAppBarSubMenu extends StatelessWidget {
  final Function onTap;
  final Function onTapSecondary;
  const SisAppBarSubMenu({Key? key, required this.onTap, required this.onTapSecondary}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: SisColor.mainColorGreen,
      padding: EdgeInsets.symmetric(horizontal: 20),
      height: MediaQuery.of(context).size.height * 0.25,
      child: Column(children: [
        GapV(5),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GapH(10),
                Image.asset(
                  '',
                  width: MediaQuery.of(context).size.width * 0.3,
                ),
                GapH(10),
              /*  Container( child:
                SisButtonLeadIconRounded(
                  icon: Icons.menu,
                  onTap: () {onTap();},
                  size: 22.sp,
                  textColor: SisColor.cyanKemkes,
                  color: SisColor.white,//.withOpacity(0.6),
                  width: MediaQuery.of(context).size.width * 0.1,
                ),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 20.0,
                            //color: SisColor.grey.withOpacity(0.9),
                            color: Colors.grey,
                            offset: Offset(0, 5)),
                      ],
                      borderRadius: BorderRadius.circular(10.0),)),*/

              /*  Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text14SpMedium(text: SisWording.appName, color: SisColor.cyanKemkes,),
                    Text10SpMedium(text: SisWording.appNameDetailLowCase2,maxLines: 2, color: Colors.black87,)
                  ],)*/
              ],),
            Container(child:
           Row(children: [ SisButtonLeadIconRounded(
             icon: Icons.notifications,
             onTap: () {/*ViewNotification.push(context);*/},
             size: 22,
             textColor: SisColor.white,
             color: SisColor.mainColorGreenLight,//.withOpacity(0.6),
             width: MediaQuery.of(context).size.width * 0.1,
           ), GapH(5),
           /*  SisButtonLeadIconRounded(
             icon: Icons.shopping_cart,
             onTap: () {onTap();},
             size: 22,
             textColor: SisColor.mainColor,
             color: SisColor.white,//.withOpacity(0.6),
             width: MediaQuery.of(context).size.width * 0.1,
           ),*/],),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 20.0,
                        //color: SisColor.cyanKemkes.withOpacity(0.6),
                        color: Colors.grey,
                        offset: Offset(0, 5)),
                  ],
                  borderRadius: BorderRadius.circular(20.0),)),
          ],)
      ],),
    );
  }
}

class SisAppBarOTP extends StatelessWidget {
  final Function onTap;
  const SisAppBarOTP({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.25,
      child: Column(children: [
        GapV(5),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GapH(5),
                Container( child:
                SisButtonLeadIconRounded(
                  icon: Icons.arrow_back_ios_rounded,
                  onTap: () {onTap();},
                  size: 22,
                  textColor: SisColor.mainColor,
                  color: SisColor.white,//.withOpacity(0.6),
                  width: MediaQuery.of(context).size.width * 0.1,
                ),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 20.0,
                            //color: SisColor.grey.withOpacity(0.9),
                            color: Colors.grey,
                            offset: Offset(0, 5)),
                      ],
                      borderRadius: BorderRadius.circular(10.0),)),
                GapH(10),

              ],),
            /* Padding(
                    padding: EdgeInsets.only(right: 25),
                    child:
                    SisButtonLeadIconRounded(
                      icon: Icons.notifications,
                      onTap: () {},
                      size: 22.sp,
                      textColor: SisColor.cyanKemkes,
                      color: SisColor.lightTeal,//.withOpacity(0.6),
                      width: MediaQuery.of(context).size.width * 0.1,
                    ))*/
          ],)
      ],),
    );
  }
}

class SisAppBarDrawer extends StatelessWidget {
  final Function onTap;
  const SisAppBarDrawer({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.25,
      child: Column(children: [
        GapV(5),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GapH(10),
                Image.asset(
                  "SisruteImages.logoKemkesTxt()",
                  width: MediaQuery.of(context).size.width * 0.1,
                ),
                GapH(10),


                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                        Text14SpBold(text: "App Name", color: SisColor.red1,),
                        Text12SpMedium(text: "Detail",maxLines: 2, color: Colors.black87,)
                    ],)
              ],),
         /*   Padding(
                padding: EdgeInsets.only(right: 25),
                child:
                Container(child: SisButtonLeadIconRounded(
                  icon: Icons.notifications,
                  onTap: () {onTap();},
                  size: 22.sp,
                  textColor: SisColor.cyanKemkes,
                  color: SisColor.white,//.withOpacity(0.6),
                  width: MediaQuery.of(context).size.width * 0.1,
                ),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 20.0,
                            //color: SisColor.cyanKemkes.withOpacity(0.6),
                            color: Colors.grey,
                            offset: Offset(0, 5)),
                      ],
                      borderRadius: BorderRadius.circular(20.0),)))*/
          ],)
      ],),
    );
  }
}

