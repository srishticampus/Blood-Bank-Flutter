import 'package:blood_bank_application/Colors/colors.dart';
import 'package:blood_bank_application/Screens/DonationHistory/widgets/donationhistorycard.dart';
import 'package:flutter/material.dart';

class Donationhistoryscreen extends StatefulWidget {
  const Donationhistoryscreen({super.key});

  @override
  State<Donationhistoryscreen> createState() => _DonationhistoryscreenState();
}

class _DonationhistoryscreenState extends State<Donationhistoryscreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
    appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: appColor,
          title: Text(
            'Blood Donation History',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
      body: ListView.builder(itemBuilder:(context, index) {
        return Donationhistorycard(size: size);
      },),
    );
  }
}