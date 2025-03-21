import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Skripsi Face Recognition'),
        backgroundColor: Colors.cyan,
      ),
      body: Center(
        child: Text('Home'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Text('+'),
        onPressed: () {},
      ),
    );
  }
}
