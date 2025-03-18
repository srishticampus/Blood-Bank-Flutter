import 'package:blood_bank_application/Colors/colors.dart';
import 'package:flutter/material.dart';

class Emptynotification extends StatefulWidget {
  const Emptynotification({super.key});

  @override
  State<Emptynotification> createState() => _EmptynotificationState();
}

class _EmptynotificationState extends State<Emptynotification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: appColor,
          title: Text(
            'Notifications',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(child: Image.asset('assets/empty.png',scale: 2)),
            Text('Empty Notifications !.....',style: TextStyle(color: appColor,fontWeight: FontWeight.bold),)
          ],
        ),
    );
  }
}