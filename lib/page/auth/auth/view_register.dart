import 'package:flutter/material.dart';
//import 'package:search_choices/search_choices.dart';
import 'package:test_rs_rat/page/auth/auth/view_login.dart';

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
  List<dynamic>? dataFaskes ;

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
  }
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return  Scaffold(body: Column(
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

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text14SpBold(text: "Pilih Asal Faskes : "),
             dataFaskes!=null ?
             dataFaskes!.isNotEmpty ?
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
            )*/ Container(): Container() : Container(),
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
    ),);
  }

  Future<void> registerAction() async {
   /* setState(() {
      _isAuthenticating = true;
    });
    String _nama = registerNamaController.text;
    String _email = registerEmailController.text;
    String _hp = registerPhoneController.text;
    String _username = registerEmailController.text;
    String _pass = registerPasswordController.text;
    String _passConfirm = registerPasswordConfirmController.text;
    RestClientApiApp api = RestClientApiApp(Dio());
    print(" $_username, $_pass");

    await api
        .register("application/json", _email, _pass,_nama, _hp, choosedFaskes!.mf_id!, "uut_selly" )
        .then((it) async {
      print("${jsonEncode(it)}");
      setState(() {
        _isAuthenticating = false;
      });
      if (it.status!) {
        SisToast.showToast(it.msg?? "Berhasil Register");
        setState(() {
          _isAuthenticating = false;
        });
        _choosed=0;
        *//* await saveToken("token");
        await saveUser(it.data);
        await saveUserID("name");

        String? _token = await getUserId();
        if(_token!=null){
          ViewMainPage.pushReplacement(context);
        }else{
          await saveToken(it.data!.tr_uuid);
          await saveUser(it.data);
          ViewMainPage.pushReplacement(context);
        }*//*
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

 // List<FaskesModel>? dataFaskes;
  Future<void> getAllFaskes() async {
/*    setState(() {
      _isLoading = true;
    });
    RestClientApiApp api = RestClientApiApp(Dio());
    await api
        .getFaskesAll("application/json")
        .then((it) async {
      print("${jsonEncode(it)}");
      setState(() {
        _isLoading = false;
      });
      if (it.status!) {
        print(jsonEncode(it.data));
        setState(() {
          dataFaskes = it.data;
        });
      } else {
        setState(() {
          dataFaskes = [];
        });
      }
    }).catchError((e) {
      dataFaskes = [];
      setState(() {
        _isLoading = false;
      });
      print("Exception ${e.toString()}");
      SisToast.showToast("Terjadi Kesalahan, Silahkan coba lagi.");
    });*/
  }
}
