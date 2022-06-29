import 'package:flutter/material.dart';
import 'package:flutter_application_2/user/dashboard.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'login.dart';
class faunalist extends StatefulWidget {
  faunalist({Key? key}) : super(key: key);

  @override
  _faunalist createState() => _faunalist();
}

class _faunalist extends State<faunalist> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(

         leading: IconButton(icon: Icon(Icons.arrow_back),onPressed: ()=> { Navigator.pushReplacement(context,
                 MaterialPageRoute(
                  builder: (context)=> Dashboard(),
                  ),
                  ) },),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("FAUNA"),
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
        body: SingleChildScrollView(     
        child:Column(
        mainAxisAlignment: MainAxisAlignment.center,
          children: [  
            SizedBox(height:20),     
            SizedBox(
              height:200,
              width: 350,
              child: InkWell(
                child: Container(
                  margin: const EdgeInsetsDirectional.only(start:22),
                  decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(30),
                    color: Colors.red,
                    image: DecorationImage(image: AssetImage('assets/images/Snow.jpg'),
                    fit: BoxFit.cover)
                  ),
                  child: Align(child: Text('SNOW LEOPARD',style: TextStyle(fontSize: 32,color: Colors.white,fontWeight: FontWeight.bold),),
                  alignment: Alignment(0.08, 1),),
                  
                  
                  ),
                  onTap: ()async{
                    final url = 'https://en.wikipedia.org/wiki/Snow_leopard';
                    if(await launch(url)){
                      await launch(url,
                      forceSafariVC: true,
                      forceWebView: true,
                      enableJavaScript: true);
                    }
                    
                  },
              ),
            ),
            SizedBox(height:20),
            SizedBox(
              
              height:200,
              width: 350,
              child: InkWell(
                 onTap: ()async{
                       final url = 'https://en.wikipedia.org/wiki/Monal';
                    if(await launch(url)){
                      await launch(url,
                      forceSafariVC: true,
                      forceWebView: true,
                      enableJavaScript: true);
                    }
                 },
                child: Container(
                 
                  margin: const EdgeInsetsDirectional.only(start:22),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.red,
                    image: DecorationImage(image: AssetImage('assets/images/Monal.jpg'),
                    fit: BoxFit.cover)
                    
                  ),
                   child: Align(child: Text('MONAL',style: TextStyle(fontSize: 32,color: Colors.white,fontWeight: FontWeight.bold),), 
                                   
             alignment: Alignment(0.08, 1),),
                ),
            ),
            ),
             SizedBox(height:20),
            SizedBox(
              
              height:200,
              width: 350,
              child: InkWell(
                 onTap: ()async{
                    final url = 'https://en.wikipedia.org/wiki/Bharal';
                    if(await launch(url)){
                      await launch(url,
                      forceSafariVC: true,
                      forceWebView: true,
                      enableJavaScript: true);
                    }
                 
                 },
                child: Container(
                 
                  margin: const EdgeInsetsDirectional.only(start:22),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.red,
                    image: DecorationImage(image: AssetImage('assets/images/Bharal.jpg'),
                    fit: BoxFit.cover)
                    
                  ),
                   child: Align(child: Text('BHARAL GOAT',style: TextStyle(fontSize: 32,color: Colors.white,fontWeight: FontWeight.bold),),                 
             alignment: Alignment(0.08, 1), ),
                ),
            ),
            ),
             SizedBox(height:20),
            SizedBox(
              
              height:200,
              width: 350,
              child: InkWell(
                 onTap: ()async{
                      final url = 'https://en.wikipedia.org/wiki/Musk_deer';
                    if(await launch(url)){
                      await launch(url,
                      forceSafariVC: true,
                      forceWebView: true,
                      enableJavaScript: true);
                    }
                 
                 },
                child: Container(
                 
                  margin: const EdgeInsetsDirectional.only(start:22),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.red,
                    image: DecorationImage(image: AssetImage('assets/images/Musk.webp'),
                    fit: BoxFit.cover)
                    
                  ),
                   child: Align(child: Text('MUSK-DEER',style: TextStyle(fontSize: 32,color: Colors.white,fontWeight: FontWeight.bold),),                 
            alignment: Alignment(0.08, 1), ),
                ),
            ),
            ),
            SizedBox(height: 20,)
          ],

          
    
    )));
  }
}
