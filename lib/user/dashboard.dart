import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/screens/Flora.dart';
import 'package:flutter_application_2/screens/faunalist.dart';

import '../screens/login.dart';

class Dashboard extends StatefulWidget {
  Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
       appBar: AppBar(
       leading: IconButton(icon: Icon(Icons.arrow_back),onPressed: ()=> { Navigator.pushReplacement(context,
                 MaterialPageRoute(
                  builder: (context)=> Login(),
                  ),
                  ) },),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Welcome User"),
            ElevatedButton(
              onPressed: () async => {
                await FirebaseAuth.instance.signOut(),
                Navigator.pushReplacement(context,
                 MaterialPageRoute(
                  builder: (context)=> Login(),
                  ),
                  ) 
               
              },
              child: Text('Logout'),
              style: ElevatedButton.styleFrom(primary: Color.fromARGB(255, 255, 94, 0)),
            )
          ],
        ),
      ),
        body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
          children: [ 
                 
            SizedBox(
              height:200,
              width: 350,
              child: InkWell(
                child: Container(
                  margin: const EdgeInsetsDirectional.only(start:22),
                  decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(30),
                    color: Colors.red,
                    image: DecorationImage(image: AssetImage('assets/images/plant.jpg'),
                    fit: BoxFit.cover)
                  ),
                  child: Align(child: Text('FLORA',style: TextStyle(fontSize: 32,color: Colors.white,fontWeight: FontWeight.bold),),
                  alignment: Alignment(0.08, 1),),
                  
                  
                  ),
                  onTap: (){
                    Navigator.pushReplacement(context,
                 MaterialPageRoute(
                  builder: (context)=> flora(),
                  ),
                  ); 
                  },
              ),
            ),
            SizedBox(height:20),
            SizedBox(
              
              height:200,
              width: 350,
              child: InkWell(
                 onTap: (){
                       Navigator.pushReplacement(context,
                 MaterialPageRoute(
                  builder: (context)=> faunalist(),
                  ),
                  );
                 
                 },
                child: Container(
                 
                  margin: const EdgeInsetsDirectional.only(start:22),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.red,
                    image: DecorationImage(image: AssetImage('assets/images/animal.jpg'),
                    fit: BoxFit.cover)
                    
                  ),
                   child: Align(child: Text('FAUNA',style: TextStyle(fontSize: 32,color: Colors.white,fontWeight: FontWeight.bold),),                 
               alignment: Alignment(0.08, 1),),
                ),
            ),
            )
          ],

          
    
    ));
  }
}
