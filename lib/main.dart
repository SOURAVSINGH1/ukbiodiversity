import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/screens/login.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  
  final Future<FirebaseApp>_initialization = Firebase.initializeApp();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot){
        if(snapshot.hasError){
          print("Something Went wrong");
        }
        if(snapshot.connectionState==ConnectionState.waiting){
          return Center(child: CircularProgressIndicator());

        }
        return MaterialApp(
      title: 'Fluter Firebass Auth',
      theme: ThemeData(
        
        primarySwatch: Colors.deepPurple,
      ),
      debugShowCheckedModeBanner: false,
      home: Login(),
    );

 });
    
    
    
    
    
    
    
     
  }
}

