import 'package:projetomobile/screens/auth/login.dart';
import 'package:projetomobile/screens/home.dart';
import 'package:projetomobile/widgets/widgets.dart';
import 'package:projetomobile/widgets/widgets_auth.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController _nome = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _senha = TextEditingController();
  TextEditingController _confirmarSenha = TextEditingController();

  bool _isLoading = false;

  Widget _authTitle() {
    return wAuthTitle(titulo: 'Registrar-se', subtitulo: 'Preencha o formulário para se registrar');
  }

  Widget _inputNome() {
    return TextField(
      controller: _nome,
      decoration: InputDecoration(
          hintText: 'Nome',
          helperText: 'Digite seu nome completo'),
    );
  }

  Widget _inputEmail() {
    return TextField(
      controller: _email,
      decoration: InputDecoration(
          hintText: 'E-mail',
          helperText: 'Digite seu e-mail'),
    );
  }

  Widget _inputPassword() {
    return Row(
      children: <Widget>[
        Expanded(
          child: TextField(
            controller: _senha,
            decoration: InputDecoration(
              hintText: '******',
              helperText: 'Senha'
            ),
          ),
        ),
        SizedBox(width: 20),
        Expanded(
          child: TextField(
            controller: _confirmarSenha,
            decoration: InputDecoration(
              hintText: '******',
              helperText: 'Confirmar Senha'
            ),
          ),
        ),
      ],
    );
  }

  Widget _inputSubmit() {
    return wInputSubmit(
        context: context, titulo: 'Registrar-se', aoPressionar: _registrarTemporario);
  }

  Widget _textDivider() {
    return wTextDivider();
  }

  Widget _googleSignIn() {
    return wGoogleSignIn(
      aoPressionar: () {},
    );
  }

  Widget _textLogin() {
    return wTextLink(
        texto: 'Já tem uma conta?',
        titulo: 'Entrar',
        aoClicar: () => wPushReplaceTo(context, Login()));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: _isLoading
          ? wAppLoading(context)
          : Scaffold(
              resizeToAvoidBottomInset: false,
              body: SafeArea(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 20),
                      _authTitle(),
                      _inputNome(),
                      _inputEmail(),
                      _inputPassword(),
                      SizedBox(height: 30),
                      _inputSubmit(),
                      _textDivider(),
                      _googleSignIn(),
                      _textLogin(),
                    ],
                  ),
                ),
              )),
    );
  }

  void _registrarTemporario() async {
    if (_email.text == 'admin' && _senha.text == 'admin') {
      setState(() {
        _isLoading = true;
      });

      await Future.delayed(Duration(seconds: 3));
      wPushReplaceTo(context, Home());
    } else {
      print('FALHA');
    }
  }
}
