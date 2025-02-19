import 'package:blood_bank_application/Colors/colors.dart';
import 'package:blood_bank_application/Screens/Blood_donation_request/widgets/blood_donation_rquest_card.dart';
import 'package:flutter/material.dart';

class BloodDonationRequestPage extends StatefulWidget {
  const BloodDonationRequestPage({super.key});

  @override
  State<BloodDonationRequestPage> createState() => _BloodDonationRequestPageState();
}

class _BloodDonationRequestPageState extends State<BloodDonationRequestPage> {
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Scaffold(
     
         appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: appColor,
          title: Text(
            'Blood Donation Request',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Blood Donation Requests',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
              SizedBox(height: size.height*0.02),
              Expanded(
                child: ListView.builder(itemBuilder: (context, index) {
                  return AllEventWidget();
                },),
              ),
            ], 
          ),
        ),
      
    );
  }
}