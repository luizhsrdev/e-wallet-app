import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

/// Widget de carregamento
Widget wAppLoading(BuildContext context){
  return Container(
    color: Theme.of(context).scaffoldBackgroundColor,
    child: Center(
      child: CircularProgressIndicator(),
    ),
  );
}

/// Navegação push
Future wPushTo(BuildContext context, Widget widget){
  return Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => widget),
  );
}

/// Navegação pushReplace
Future wPushReplaceTo(BuildContext context, Widget widget){
  return Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => widget),
  );
}

/// Botão de envio
Widget wInputSubmit({required BuildContext context, required String titulo, required Function() aoPressionar}) {
    return Container(
        width: double.infinity,
        child: ElevatedButton(
          style: ButtonStyle(shape: MaterialStateProperty.all(StadiumBorder())),
          child: Text(titulo),
          onPressed: aoPressionar,
        ));
}

/// Toast personalizado
Future wShowToast(String mensagem){
  return Fluttertoast.showToast(
    msg: mensagem,
    backgroundColor: Colors.black54,
    textColor: Colors.white,
    toastLength: Toast.LENGTH_LONG);
}
