import 'dart:convert';

import 'package:custom_searchable_dropdown/custom_searchable_dropdown.dart';
import 'package:dio/dio.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
//import 'package:search_choices/search_choices.dart';
import 'package:test_rs_rat/page/auth/view_login.dart';

import '../../../common/view_component/gap.dart';
import '../../../common/view_component/sis_buttons.dart';
import '../../../common/view_component/sis_color.dart';
import '../../../common/view_component/sis_textField.dart';
import '../../../common/view_component/sis_texts.dart';
import '../../../common/view_component/sistoast.dart';

class ViewRegisterPage extends StatefulWidget {
  const ViewRegisterPage({Key? key}) : super(key: key);

  @override
  State<ViewRegisterPage> createState() => _ViewRegisterPageState();
  static push(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => ViewRegisterPage(),
      ),
    );
  } static pushReplacement(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => ViewRegisterPage(),
      ),
    );
  }
}

class _ViewRegisterPageState extends State<ViewRegisterPage> {
  late TextEditingController registerPasswordController;
  late TextEditingController registerPasswordConfirmController;
  late TextEditingController registerEmailController;
  late TextEditingController registerPhoneController;
  late TextEditingController registerNamaController;
  bool isEmptyRegPass = true;
  bool isEmptyRegPassConf = true;
  bool isEmptyRegEmail = true;
  bool isEmptyRegNama = true;
  bool isEmptyRegPhone = true;
  bool _isAuthenticating = false;
  var choosedFaskes;
  var dropdownValue;
  var dataFaskes ;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    registerPasswordConfirmController = TextEditingController()
      ..addListener(() {        setState(() {isEmptyRegPassConf = registerPasswordConfirmController.text.isEmpty;});
      });
    registerPasswordController = TextEditingController()
      ..addListener(() {        setState(() {isEmptyRegPass = registerPasswordController.text.isEmpty;});
      });
    registerEmailController = TextEditingController()
      ..addListener(() {        setState(() {isEmptyRegEmail = registerEmailController.text.isEmpty;});
      });
    registerNamaController = TextEditingController()
      ..addListener(() {        setState(() {isEmptyRegNama = registerNamaController.text.isEmpty;});
      });
    registerPhoneController = TextEditingController()
      ..addListener(() {        setState(() {isEmptyRegPhone = registerPhoneController.text.isEmpty;});
      });
    getAllFaskes();
  }
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return  Scaffold(body: SingleChildScrollView(child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GapV(50),
        Image.asset(
          "assets/images/logo.png",
          width: MediaQuery.of(context).size.width * 0.8,
        ),
        GapV(50),
        Text20SpBold(text: "Register"),
        GapV(5),
        Container(height: 1,
          width: double.infinity,
          color: Colors.grey,
        ),
        GapV(25),

        Container(
          width: size.width *0.9,
          child: SisTextField(text: "Nama Lengkap", textInputType: TextInputType.text,  obscureText: false, icon: Icons.person, controller: registerNamaController , ),
        ),
        GapV(10),
        Container(
          width: size.width *0.9,
          child: SisTextField(text: "Email", textInputType: TextInputType.emailAddress,  obscureText: false, icon: Icons.mail, controller: registerEmailController , ),
        ),
        GapV(10),
        Container(
          width: size.width *0.9,
          child: SisTextField(text: "Nomor HP", textInputType: TextInputType.phone,  obscureText: false, icon: Icons.phone, controller: registerPhoneController , ),
        ),
        GapV(10),
        Container(
          width: size.width *0.9,
          child: SisTextField(text: "Password", textInputType: TextInputType.visiblePassword,  obscureText: true, icon: Icons.lock, controller: registerPasswordController , ),
        ),
        GapV(10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text14SpBold(text: "Pilih Asal Faskes : "),
            dataFaskes!=null ?
            dataFaskes!.isNotEmpty ?
            Container(
              width: MediaQuery.of(context).size.width *0.85,
              child:   CustomSearchableDropDown(
                items: dataFaskes!,
                label: 'Select Name',
                decoration: BoxDecoration(
                    border: Border.all(
                        color: Colors.blue
                    )
                ),
                prefixIcon:  Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Icon(Icons.search),
                ),
                dropDownMenuItems: dataFaskes?.map((item) {
                  return item.mf_nama;
                }).toList() ??
                    [],
                onChanged: (value){
                  if(value!=null)
                  {
                    choosedFaskes = value;
                    print(jsonEncode(choosedFaskes));
                  }
                  else{
                    choosedFaskes=null;
                  }
                },
              ),)
            /* SearchChoices.single(
              items: dataFaskes!
                  .map(
                    (e) => DropdownMenuItem(
                  child: Text14SpBold(
                    text: e.mf_nama.toString(),
                  ),
                  value: e,
                ),
              )
                  .toList(),
              displayClearIcon: false,
              icon: const Icon(Icons.arrow_drop_down_circle),
              value: choosedFaskes,
              hint: Text14SpBold(
                text: "Pilih Asal Faskes ",
                ellipsis: true,
                textAlign: TextAlign.start,
              ),
              searchHint: "Pilih Asal Faskes",
              onChanged: (value) async {
                setState(() {
                  choosedFaskes = value;
                });
              },
              isExpanded: true,
            )*/ : Container() : Container(),
          ],) ,
        GapV(20),
        Center(child:
        Container(
          width: size.width *0.5,
          child: SisButtonRounded(text: "Register", onTap: (){  !isEmptyRegEmail && !isEmptyRegNama && !isEmptyRegPass&& !isEmptyRegPhone && choosedFaskes!=null
              ? /*!isEmptyRegPass! != isEmptyRegPassConf ? (){} :*/ /*SisToast.showToast("Password tidak sama! ")*/ registerAction()
              : SisToast.showToast("Lengkapi Data Register Terlebih Dahulu! ");
          },
            color: !isEmptyRegEmail && !isEmptyRegNama && !isEmptyRegPass && !isEmptyRegPhone && choosedFaskes!=null
                ? SisColor.mainColorGreen
                : Colors.grey[300],
            textColor: !isEmptyRegEmail && !isEmptyRegNama && !isEmptyRegPass && !isEmptyRegPhone &&choosedFaskes!=null
                ? Colors.white
                : Colors.grey,
            padding: EdgeInsets.symmetric(vertical: 10),
            isLoading:_isAuthenticating,),
        ),),
        GapV(20),
        Text16SpMedium(text: "Sudah Punya Akun?"),
        InkWell(child:     Text20SpBold(text: "Login", color: Colors.blue,), onTap: (){ViewLoginPage.push(context);},)
      ],
    ),),);
  }

  Future<void> registerAction() async {

  }

 // List<FaskesModel>? dataFaskes;
  Future<void> getAllFaskes() async {

  }

}
