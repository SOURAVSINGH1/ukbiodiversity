
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/screens/forgotpassword.dart';
import 'package:flutter_application_2/screens/sinup.dart';
import 'package:flutter_application_2/user/user_main.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:google_fonts/google_fonts.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();

  var email = "";
  var password = "";
  // Create a text controller and use it to retrieve the current value
  // of the TextField.
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  userLogin() async{
    try{
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
        Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context)=>
      UserMain()));
    }  on FirebaseAuthException catch(e){
      if(e.code=='user-not-found'){
        print("user not found");
         ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.redAccent,
            content: Text(
              "User not Registered Plese Register",
              style: TextStyle(fontSize: 20.0),
            ),)
        );
      } else if(e.code=='wrong-password'){
        print("wrong password");
         ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.redAccent,
            content: Text(
              "Wrong Password",
              style: TextStyle(fontSize: 20.0),
            ),)
        );
      }
    }
  }

  @override
  void dispose(){

    emailController.dispose();
    passwordController.dispose();
    super.dispose();

  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("user Login"),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical:  20,horizontal: 30
          ),
          child: ListView(
            children: [
              Image.asset("assets/images/login_pic.png",
            fit: BoxFit.cover,),
            
            Row(
  mainAxisSize: MainAxisSize.min,
  children: <Widget>[
    
    const SizedBox(width: 105.0, height: 40.0),
    DefaultTextStyle(
      style: const TextStyle(
        fontWeight: FontWeight.bold,
           
        fontSize: 30.0,
        fontFamily: 'Poppins',
        color: Color.fromARGB(255, 252, 134, 0),
      ),
      child: AnimatedTextKit(
        animatedTexts: [
       TypewriterAnimatedText('प्रणाम'),
        TypewriterAnimatedText('सिवासौँळी'),
        TypewriterAnimatedText('नमस्ते'),
        ],
        repeatForever: true,
        pause: const Duration(milliseconds: 1000),
        
      ),
    ),
  ],
),
              Container(
                 
                margin: EdgeInsets.symmetric(vertical: 10.0),
                child: TextFormField(
                  autofocus: false,
                  decoration: InputDecoration(
                      labelText: 'Email: ',
                     labelStyle: TextStyle(fontSize: 20.0),
                
                      errorStyle:
                          TextStyle(color: Colors.redAccent, fontSize: 15),
                    ),
                  controller: emailController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter Email';
                    } else if (!value.contains('@')) {
                      return 'Please Enter Valid Email';
                    }
                    return null;
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10.0),
                child: TextFormField(
                  autofocus: false,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password: ',
                    labelStyle: TextStyle(fontSize: 20.0),
                  
                    errorStyle:
                        TextStyle(color: Colors.redAccent, fontSize: 15),
                 ) ,
                  controller: passwordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter Password';
                    }
                    return null;
                  },
                ),
              ),
               Container(
                margin: EdgeInsets.only(left: 60.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // Validate returns true if the form is valid, otherwise false.
                        if (_formKey.currentState!.validate()) {
                          setState(() {
                            email = emailController.text;
                            password = passwordController.text;
                          });
                          userLogin();
                          
                        }
                      },
                      child: Text(
                        'Login',
                        style: TextStyle(fontSize: 18.0),
                      ),
                    ),
                    TextButton(
                      onPressed: () =>  {Navigator.pushAndRemoveUntil(
                                  context,
                                  PageRouteBuilder(
                                    pageBuilder: (context, a, b) => ForgotPassword(),
                                    transitionDuration: Duration(seconds: 0),
                                  ),
                                  (route) => false)},
                      child: Text(
                        'Forgot Password ?',
                        style: TextStyle(fontSize: 14.0),
                      ),
                    ),
                  ],
                ),
              ),
               Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an Account? "),
                    TextButton(
                      onPressed: () => {
                        Navigator.pushAndRemoveUntil(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (context, a, b) => Signup(),
                              transitionDuration: Duration(seconds: 0),
                            ),
                            (route) => false)
                      },
                      child: Text('Signup'),
                    ),
                  ],
      ),
    )
            ],
          ),
        ),
      ),
    );
  }
}