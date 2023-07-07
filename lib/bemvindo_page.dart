import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:testeapi/home_page.dart';

class BemVindoPage extends StatefulWidget {
  const BemVindoPage({Key? key}) : super(key: key);

  @override
  State<BemVindoPage> createState() => _BemVindoPageState();
}

class _BemVindoPageState extends State<BemVindoPage> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    verificarUsuario().then((temUsuario){
      if(temUsuario){
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const HomePage())
      }else{
        print('Não tem Usuario');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Bem vindo page'),
      )
    );
  }

  Future<bool> verificarUsuario() async{
    SharedPreferences _sharedPreferences = await SharedPreferences.getInstance();
    String? token = _sharedPreferences.getString('token');
    if(token == null){
      return false;
    } else{
      return true;
    }
  }
}
