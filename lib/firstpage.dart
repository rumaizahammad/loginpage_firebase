import 'package:flutter/material.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(body: SafeArea(child: Column(mainAxisAlignment: MainAxisAlignment.center,children: [Center(child: Text("FirstPage"),)],)),);
  }
}