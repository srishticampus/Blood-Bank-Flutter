
import 'package:blood_bank_application/DashBoard/widgets/emergencyalertdetails.dart';
import 'package:blood_bank_application/Screens/Blood_donation_request/blood_donation_request.dart';
import 'package:blood_bank_application/Screens/Blood_donation_request/blood_donationdetailsscreen.dart';
import 'package:blood_bank_application/Screens/DonationHistory/donationhistoryscreen.dart';
import 'package:blood_bank_application/Screens/Profile/profilescreen.dart';
import 'package:flutter/material.dart';


var customRoutes = <String, WidgetBuilder>{
   
    '/profilescreen':(context)=>Profilescreen(),
            'blood_request_screen':(context)=>BloodDonationRequestPage(),
            'blood_donation_details': (context) {
    String id = ModalRoute.of(context)!.settings.arguments.toString();
    return BloodDonationdetailsscreen(
      id: id,
    );
  },
  'emergency_alert_details': (context) {
    String id = ModalRoute.of(context)!.settings.arguments.toString();
    return Emergencyalertdetails(
      id: id,
    );
  },
  'blood_donation_history':(context)=>Donationhistoryscreen()
         
};
