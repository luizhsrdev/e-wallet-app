import 'package:projetomobile/screens/auth/login.dart';
import 'package:projetomobile/screens/home.dart';
import 'package:projetomobile/widgets/widgets.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    _verificarUsuarioTemporario(false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: wAppLoading(context)
    );
  }

  void _verificarUsuarioTemporario(bool usuario) async {
    await Future.delayed(Duration(seconds: 3));
    wPushReplaceTo(context, usuario ? Home() : Login());
  }
}
