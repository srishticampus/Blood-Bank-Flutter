import 'package:animate_do/animate_do.dart';
import 'package:blood_bank_application/Colors/colors.dart';
import 'package:blood_bank_application/Screens/Images/images.dart';
import 'package:blood_bank_application/Screens/LoginScreen/loginscreen.dart';

import 'package:blood_bank_application/Screens/LoginScreen/roundbutton.dart';
import 'package:flutter/material.dart';

class Onboradingscreen extends StatefulWidget {
  const Onboradingscreen({super.key});

  @override
  State<Onboradingscreen> createState() => _OnboradingscreenState();
}

class _OnboradingscreenState extends State<Onboradingscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: ElasticInDown(
          duration: Duration(milliseconds: 1500),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 20,),
                  Image.asset(applogo,scale: 3),
              Image.asset(onboardImage,scale: 1.8),
              SizedBox(height: 10,),
              Text('Give Blood,Save Life',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
              SizedBox(height: 3),
              Text('Its A Simple Yet Profound Way'),
              
               Text('To Make A Difference'),
              SizedBox(height: 50),
          
              LoginButton(title: 'Get Started', onTap:(){
                
                Navigator.push(context,MaterialPageRoute(builder: (context)=>LoginScreen()));
              })
            ],
          ),
        ),
      ),
      
    );
  }
}