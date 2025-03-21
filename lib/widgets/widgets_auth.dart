import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

Widget wAuthTitle({required String titulo, required String subtitulo}) {
  return Container(
    width: double.infinity,
    padding: EdgeInsets.only(bottom: 20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          titulo,
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 3),
        Text(subtitulo),
      ],
    ),
  );
}

Widget wTextDivider() {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 20),
    child: Row(
      children: <Widget>[
        Expanded(child: Divider()),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            'OU CONECTE-SE COM',
            style: TextStyle(fontSize: 12, color: Colors.grey),
          ),
        ),
        Expanded(child: Divider()),
      ],
    ),
  );
}

Widget wGoogleSignIn({required Function() aoPressionar}) {
  return Container(
    width: double.infinity,
    child: ElevatedButton.icon(
      icon: Icon(MdiIcons.google, size: 20),
      label: Text('Google'),
      onPressed: aoPressionar,
    ),
  );
}

Widget wTextLink({
  required String texto,
  required String titulo,
  required Function() aoClicar,
}) {
  return Container(
    margin: EdgeInsets.only(top: 40),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(texto),
        GestureDetector(
          child: Container(
            padding: EdgeInsets.all(10),
            color: Colors.transparent,
            child: Text(titulo, style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          onTap: aoClicar,
        ),
      ],
    ),
  );
}
