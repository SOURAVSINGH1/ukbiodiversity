import 'package:flutter/material.dart';
import 'package:flutter_application_2/user/dashboard.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'login.dart';
class flora extends StatefulWidget {
  flora({Key? key}) : super(key: key);

  @override
  _flora createState() => _flora();
}

class _flora extends State<flora> {
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
            Text("FLORA"),
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
                    image: DecorationImage(image: AssetImage('assets/images/Cinquefoil.jpg'),
                    fit: BoxFit.cover)
                  ),
                  child: Align(child: Text('CINQUEFOIL',style: TextStyle(fontSize: 32,color: Colors.white,fontWeight: FontWeight.bold),),
                  alignment: Alignment(0.08, 1),),
                  
                  
                  ),
                  onTap: ()async{
                     final url = 'https://en.wikipedia.org/wiki/Potentilla';
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
                  final url = 'https://en.wikipedia.org/wiki/Meconopsis';
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
                    image: DecorationImage(image: AssetImage('assets/images/Meconopsis.jpg'),
                    fit: BoxFit.cover)
                    
                  ),
                   child: Align(child: Text('MECONOPSIS',style: TextStyle(fontSize: 32,color: Colors.white,fontWeight: FontWeight.bold),), 
                                   
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
                  final url = 'https://en.wikipedia.org/wiki/Rhododendron';
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
                    image: DecorationImage(image: AssetImage('assets/images/Buransh.jpg'),
                    fit: BoxFit.cover)
                    
                  ),
                   child: Align(child: Text('BURANSH',style: TextStyle(fontSize: 32,color: Colors.white,fontWeight: FontWeight.bold),),                 
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
                  final url = 'https://en.wikipedia.org/wiki/Saussurea_obvallata';
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
                    image: DecorationImage(image: AssetImage('assets/images/Brahma.jpg'),
                    fit: BoxFit.cover)
                    
                  ),
                   child: Align(child: Text('BRAHMA KAMAL',style: TextStyle(fontSize: 32,color: Colors.white,fontWeight: FontWeight.bold),),                 
            alignment: Alignment(0.08, 1), ),
                ),
            ),
            ),
            SizedBox(height: 20,)
          ],

          
    
    )));
  }
}
