import 'package:flutter/material.dart';
import 'package:projetomobile/screens/auth/forgot_password.dart';
import 'package:projetomobile/screens/auth/register.dart';
import 'package:projetomobile/screens/home.dart';
import 'package:projetomobile/widgets/widgets.dart';
import 'package:projetomobile/widgets/widgets_auth.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _email = TextEditingController();
  TextEditingController _senha = TextEditingController();
  bool _obscureText = true;
  bool _isLoading = false;

  Widget _authTitle() {
    return wAuthTitle(titulo: 'Entrar', subtitulo: 'Digite seu e-mail e senha');
  }

  Widget _inputEmail() {
    return TextField(
      controller: _email,
      decoration: InputDecoration(hintText: 'E-mail'),
    );
  }

  Widget _inputPassword() {
    return Stack(
      children: <Widget>[
        TextField(
          controller: _senha,
          obscureText: _obscureText,
          decoration: InputDecoration(
            hintText: 'Senha',
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: IconButton(
            icon: Icon(_obscureText ? Icons.visibility_off : Icons.visibility,
                color: Colors.grey),
            onPressed: () {
              setState(() {
                _obscureText = !_obscureText;
              });
            },
          ),
        )
      ],
    );
  }

  Widget _forgotPassword() {
    return GestureDetector(
      child: Align(
        alignment: Alignment.centerLeft,
        child: Container(
            color: Colors.transparent,
            padding: EdgeInsets.fromLTRB(0, 20, 20, 20),
            child: Text('Esqueceu a Senha?')),
      ),
      onTap: () => wPushTo(context, ForgotPassword())
    );
  }

  Widget _inputSubmit() {
    return wInputSubmit(
        context: context, titulo: 'Entrar', aoPressionar: _loginTemporario);
  }

  Widget _textDivider() {
    return wTextDivider();
  }

  Widget _googleSignIn() {
    return wGoogleSignIn(
      aoPressionar: () {},
    );
  }

  Widget _textRegister() {
    return wTextLink(
        texto: 'Ainda não tem uma conta?',
        titulo: 'Registrar-se',
        aoClicar: () => wPushReplaceTo(context, Register()));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: _isLoading
          ? wAppLoading(context)
          : Scaffold(
              resizeToAvoidBottomInset: false,
              body: Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    _authTitle(),
                    _inputEmail(),
                    _inputPassword(),
                    _forgotPassword(),
                    _inputSubmit(),
                    _textDivider(),
                    _googleSignIn(),
                    _textRegister(),
                  ],
                ),
              )),
    );
  }

  void _loginTemporario() async {
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
