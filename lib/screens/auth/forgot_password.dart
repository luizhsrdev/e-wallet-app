import 'package:projetomobile/widgets/widgets.dart';
import 'package:projetomobile/widgets/widgets_auth.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({ Key? key }) : super(key: key);

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  bool _isLoading = false;
  TextEditingController _email = TextEditingController();

  Widget _inputEmail() {
    return TextField(
      controller: _email,
      decoration: InputDecoration(
        hintText: 'E-mail',
        helperText: 'Digite seu e-mail',
      ),
    );
  }

  Widget _inputSubmit() {
    return wInputSubmit(
        context: context, titulo: 'Enviar', aoPressionar: _enviarTemporario);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: _isLoading
          ? wAppLoading(context)
          : Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                iconTheme: IconThemeData(color: Colors.black),
              ),
              resizeToAvoidBottomInset: false,
              body: Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 30),
                    wAuthTitle(
                      titulo: 'Esqueceu a Senha',
                      subtitulo: 'Digite seu e-mail e enviaremos um link\npara redefinir sua senha',
                    ),
                    _inputEmail(),
                    SizedBox(height: 30),
                    _inputSubmit(),
                  ],
                ),
              )),
    );
  }

  void _enviarTemporario() async {
    if (_email.text.isNotEmpty) {
      setState(() {
        _isLoading = true;
      });
      print('SUCESSO');
      await Future.delayed(Duration(seconds: 2));
      wShowToast('E-mail enviado! Verifique sua caixa de entrada para redefinir sua senha.');
      Navigator.pop(context);
    } else {
      print('FALHA');
    }
  }
}
