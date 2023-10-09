
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:loginpage_firebase/firstpage.dart';
import 'package:loginpage_firebase/signuppage.dart';      

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController emailcontroller=TextEditingController();
  TextEditingController passwordcontroller=TextEditingController();
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar ( title:Text("LOGIN"), backgroundColor: Colors.blueAccent,),
      body:
    
            Center(child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
           children: [
            SizedBox(height: 40,),
            Center(child: Icon(Icons.lock,size: 60,)),
 SizedBox(height: 40,),
 Text(style: TextStyle(fontSize: 25,color:Color.fromARGB(205, 39, 140, 187)),"LOGIN"),
           Padding(
             padding: const EdgeInsets.all(8.0),
             child: TextField( controller: emailcontroller, decoration: InputDecoration(border: OutlineInputBorder(),hintText: "Email",prefixIcon: Icon(Icons.mail)),),
           ),
           Padding(
             padding: const EdgeInsets.all(8.0),
             child: TextField(controller: passwordcontroller, decoration: InputDecoration(border: OutlineInputBorder(),hintText: "Password",prefixIcon: Icon(Icons.lock)),),
           ),
          
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(onPressed:(){
                checklogin(context);
              } , child: Text("login"),
              ),
            ),ElevatedButton(onPressed: (){
    
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>SignUp()));
            }, child: Text("SignUp"))
          ],
        ),
      ),
    );
  
  }
  void checklogin(BuildContext ctx) async{
    final username = emailcontroller.text;
    final pswd = passwordcontroller.text;
    if (username.isNotEmpty && pswd.isNotEmpty) {
      try{
        UserCredential userCredential= await
      FirebaseAuth.instance
          .signInWithEmailAndPassword(email: username, password: pswd);
           Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => FirstPage(),
              ));
      }
      catch (e){
       String errormessage="invalid";
       
        }
        ScaffoldMessenger.of(ctx).showSnackBar(
          SnackBar(content: Text(style: TextStyle(color:const Color.fromARGB(96, 239, 0, 0)),"USER NAME AND PASSWORD INVALID ")));


      
    } else {
      ScaffoldMessenger.of(ctx).showSnackBar(
          SnackBar(content: Text( "Username and Password empty")));
          
          
    }
    ;
    
  }
}