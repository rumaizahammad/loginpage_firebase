import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:loginpage_firebase/firstpage.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController emailcontroller=TextEditingController();
  TextEditingController passwordcontroller=TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("SignUp"),backgroundColor:const Color.fromARGB(255, 128, 73, 223),),
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            decoration: InputDecoration(border: OutlineInputBorder(),hintText: "Full Name"),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(decoration: InputDecoration(border: OutlineInputBorder(),hintText: "Age"),),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(decoration: InputDecoration(border: OutlineInputBorder(),hintText: "Phone ")),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(controller: emailcontroller, decoration: InputDecoration(border: OutlineInputBorder(),hintText: "Email ")),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(decoration: InputDecoration(border: OutlineInputBorder(),hintText: "Address ")),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(controller: passwordcontroller, decoration: InputDecoration(border: OutlineInputBorder(),hintText: "Password ")),
        
        ),
Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(decoration: InputDecoration(border: OutlineInputBorder(),hintText: "Confirm Password ")),
        
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(onPressed: () {
            sign_up();


          }, child: Text("submit")),
        )
      ],
    ));
  }
  void sign_up(){
    final email=emailcontroller.text;
    final pswd=passwordcontroller.text;
    if(email.isNotEmpty &&pswd.isNotEmpty){
      FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: pswd).then((value) => Navigator.push(context,MaterialPageRoute(builder: (context) => FirstPage(),) ));
  }
}}