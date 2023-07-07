import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final _formKey = GlobalKey<FormState>();
  final _reController = TextEditingController();
  final _senhaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children:[
              TextFormField(
                controller: _reController,
                decoration: const InputDecoration(
                  label: Text ('RE'),
                  hintText: 'Digite seu RE'
                ),
                validator: (re){
                  if (re == null || re.isEmpty){
                    return 'Digite o seu RE';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _senhaController,
                decoration: const InputDecoration(
                  label: Text('senha'),
                    hintText: 'Digite a sua Senha',
                ),
                validator: (senha){
                  if (senha == null || senha.isEmpty){
                    return 'Digite a sua senha';
                  } else if(senha.length < 4){
                    return 'Senha muito curta';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 12),
              ElevatedButton(
                  onPressed: (){
                    if (_formKey.currentState?.validate()?? false){
                    }
                  }, child: const Text(
                'ENTRAR'
              ),
              )
            ]
          )
        )
      )
    );
  }
  logar() async{
    print('Logando');
  }
}
