import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_rs_rat/page/auth/auth/view_register.dart';

import '../../../common/view_component/gap.dart';
import '../../../common/view_component/sis_buttons.dart';
import '../../../common/view_component/sis_color.dart';
import '../../../common/view_component/sis_textField.dart';
import '../../../common/view_component/sis_texts.dart';
import '../../../common/view_component/sistoast.dart';
import '../../main_page/view_main_page.dart';

class ViewLoginPage extends StatefulWidget {
  const ViewLoginPage({Key? key}) : super(key: key);

  @override
  State<ViewLoginPage> createState() => _ViewLoginPageState();
  static push(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => ViewLoginPage(),
      ),
    );
  } static pushReplacement(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => ViewLoginPage(),
      ),
    );
  }
}

class _ViewLoginPageState extends State<ViewLoginPage> {
  late TextEditingController loginEmailController;
  late TextEditingController loginPasswordController;
  bool isEmptyLoginEmail = true;
  bool isEmptyLoginPass = true;
  bool _isAuthenticating = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loginEmailController = TextEditingController()
      ..addListener(() {
        setState(() {isEmptyLoginEmail = loginEmailController.text.isEmpty;});
      });
    loginPasswordController = TextEditingController()
      ..addListener(() {        setState(() {isEmptyLoginPass = loginEmailController.text.isEmpty;});
      });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GapV(50),
        Image.asset(
          "assets/images/logo.png",
          width: MediaQuery.of(context).size.width * 0.8,
        ),
        GapV(50),
        Text20SpBold(text: "Login"),
        GapV(5),
        Container(height: 1,
          width: double.infinity,
          color: Colors.grey,
        ),
        GapV(25),
        Container(
          width: size.width *0.9,
          child: SisTextField(text: "Email", textInputType: TextInputType.emailAddress,  obscureText: false, icon: Icons.person, controller: loginEmailController , ),
        ),
        GapV(10),
        Container(
          width: size.width *0.9,
          child: SisTextField(text: "Password", textInputType: TextInputType.visiblePassword,  obscureText: true, icon: Icons.lock, controller: loginPasswordController , ),
        ),
        GapV(20),
        GapV(20),
        Center(child:
        Container(
          width: size.width *0.5,
          child: SisButtonRounded(text: "Log In",
            onTap: (){
              !isEmptyLoginEmail && !isEmptyLoginPass
                  ? logingAction()
                  : SisToast.showToast("Lengkapi Email dan Password Terlebih Dahulu! ");
            },
            color: !isEmptyLoginEmail && !isEmptyLoginPass
                ? SisColor.mainColorGreen
                : Colors.grey[300],
            textColor: !isEmptyLoginEmail && !isEmptyLoginPass
                ? Colors.white
                : Colors.grey,
            isLoading:_isAuthenticating,
            padding: EdgeInsets.symmetric(vertical: 10),
          ),
        ),),
        GapV(20),
        Text16SpMedium(text: "Belum Punya Akun?"),
        InkWell(child:     Text20SpBold(text: "Register", color: Colors.blue,), onTap: (){ViewRegisterPage.push(context);},)
       ],
    ),);
  }

  Future<void> logingAction() async {
    setState(() {
      _isAuthenticating = true;
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String _username = loginEmailController.text;
    String _pass = loginPasswordController.text;
   // RestClientApiApp api = RestClientApiApp(Dio());
    print(" $_username, $_pass");

   /* await api
        .login("application/json", _username, _pass,"uut_selly")
        .then((it) async {
      print("${jsonEncode(it)}");
      setState(() {
        _isAuthenticating = false;
      });
      if (it.status!) {
        SisToast.showToast(it.msg?? "Berhasil Login");
        await saveToken("token");
        await saveUser(it.data);
        await saveUserID("name");

        String? _token = await getUserId();
        if(_token!=null){
          ViewMainPage.pushReplacement(context);
        }else{
          await saveToken(it.data!.tr_uuid);
          await saveUser(it.data);
          await saveUserID(it.data!.tr_id);
          ViewMainPage.pushReplacement(context);
        }
      } else {
        SisToast.showToast(it.msg?? "Terjadi Kesalahan, Silahkan coba lagi");
      }
    }).catchError((e) {
      setState(() {
        _isAuthenticating = false;
      });
      print("Exception ${e.toString()}");
      SisToast.showToast("Terjadi Kesalahan, Silahkan coba lagi.");
    });*/
  }
}
