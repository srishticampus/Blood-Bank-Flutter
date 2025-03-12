import 'package:blood_bank_application/API/BloodRequestAPI/bloodrequestprovider.dart';
import 'package:blood_bank_application/Colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BloodDonationdetailsscreen extends StatefulWidget {
  static const routname='blood_donation_details';
  final String id;
  const BloodDonationdetailsscreen({super.key,required this.id});

  @override
  State<BloodDonationdetailsscreen> createState() =>
      _BloodDonationdetailsscreenState();
}

class _BloodDonationdetailsscreenState
    extends State<BloodDonationdetailsscreen> {
  @override
  Widget build(BuildContext context) {
    final bloodData =
        Provider.of<Bloodrequestprovider>(context).bloodrequest.firstWhere((element) => element.id == widget.id);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appColor,
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          'Blood Donation Request Details',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: Text('Blood Donation Request Details',
            style: TextStyle(
              decoration: TextDecoration.underline,
              color: appColor,fontWeight: FontWeight.bold,fontSize: 18),)),
            SizedBox(height: 20),
            BloodDetailsCard(
                icon: Icons.person, label: 'Patient Name : ${bloodData.patientName}'),
            BloodDetailsCard(
                icon: Icons.circle, label: 'MR No : ${bloodData.mrNo}'),
            BloodDetailsCard(
                icon: Icons.person, label: 'By Stander Name : ${bloodData.bystanderName}'),
            BloodDetailsCard(
                icon: Icons.phone_android, label: 'By Stander Contact Number : ${bloodData.bystanderContactNo}'),
            BloodDetailsCard(
                icon: Icons.local_hospital,label: 'Diagnosis : ${bloodData.diagnosis}'),
            BloodDetailsCard(
                icon: Icons.person_pin_circle, label: 'Doctor Assigned : ${bloodData.doctorAssigned}'),
            BloodDetailsCard(
                icon: Icons.bloodtype, label: 'Blood Type : ${bloodData.bloodType}'),
            BloodDetailsCard(
                icon: Icons.bloodtype, label: 'Blood Units Required : ${bloodData.bloodUnitsRequired}'),
            BloodDetailsCard(
                icon: Icons.priority_high, label: 'Priority : ${bloodData.priority}'),
            BloodDetailsCard(
                icon: Icons.calendar_month, label: 'Requested Date : ${bloodData.requestedDate}'),
          ],
        ),
      ),
    );
  }
}

Widget BloodDetailsCard({IconData? icon, String? label}) {
  return Column(
    children: [
      Row(
        children: [Icon(icon, color: appColor),SizedBox(width: 10), Text(label!)],
      ),
     SizedBox(height: 15)
    ],
  );
}
