import 'package:animate_do/animate_do.dart';
import 'package:blood_bank_application/Colors/colors.dart';
import 'package:blood_bank_application/Screens/Images/images.dart';
import 'package:blood_bank_application/Screens/OnboardingScreen/onboard.dart';

import 'package:flutter/material.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
@override
void initState() {
  super.initState();
  navigatoehome();
}

 navigatoehome() async {
  await Future.delayed(const Duration(milliseconds: 2500));
   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const GetstartedScreen()));
 }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body:ZoomIn(
        duration: Duration(milliseconds: 1500),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 50),
            Center(child: Image.asset(applogo,scale: 3)),
              SizedBox(height: 50),
          ],
        ),
      )
    );
  }
}