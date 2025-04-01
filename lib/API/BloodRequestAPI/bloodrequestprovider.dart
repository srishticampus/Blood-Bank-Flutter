import 'dart:convert';
import 'dart:io';
import 'package:blood_bank_application/API/BloodRequestAPI/bloodrequestmodel.dart';
import 'package:blood_bank_application/Colors/colors.dart';
import 'package:blood_bank_application/DashBoard/dashboardscreen.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as https;

class Bloodrequestprovider with ChangeNotifier {
  bool _isLoading = false;
  bool get islOading {
    return _isLoading;
  }

  final bool _loadingSpinner = false;
  bool get loadingSpinner {
    return _loadingSpinner;
  }

  bool _isSelect = false;

  bool get isSelect {
    return _isSelect;
  }

  final bool _isError = false;

  bool get isError {
    return _isError;
  }

  List<BloodrequestModel> _bloodrequest = [];
  List<BloodrequestModel> get bloodrequest {
    return [..._bloodrequest];
  }

  Future getAllBloodRequestData({required BuildContext context,required String userid}) async {
    try {
      _isLoading = true;
      // var headers = {'Cookie': 'ci_session=c7lis868nec6nl8r1lb5el72q8n26upv'};
      var response = await https.get(
        Uri.parse(
            "http://campus.sicsglobal.co.in/Project/Blood_Bank/phpfiles/api/view_blood_request.php?donor_id=$userid"),
      );

      print(
        "http://campus.sicsglobal.co.in/Project/Blood_Bank/phpfiles/api/view_blood_request.php?donor_id=$userid");

      print(response.body);

      if (response.statusCode == 200) {
        _isLoading = false;
        _bloodrequest = [];
        var extractedData = json.decode(response.body);
        //  print(json.decode(response.body) + 'printed extrated data');
        final List<dynamic> emergencydetails = extractedData['requests'];
        for (var i = 0; i < emergencydetails.length; i++) {
          _bloodrequest.add(
            BloodrequestModel(
              id: emergencydetails[i]['id'].toString(),
              patientName: emergencydetails[i]['patient_name'].toString(),
              mrNo: emergencydetails[i]['mr_no'].toString(),
              bystanderName: emergencydetails[i]['bystander_name'].toString(),
              bystanderContactNo:emergencydetails[i]['bystander_contact_no'].toString(),   
              diagnosis: emergencydetails[i]['diagnosis'].toString(),
              doctorAssigned: emergencydetails[i]['doctor_assigned'].toString(),
              bloodType: emergencydetails[i]['blood_type'].toString(),
              bloodUnitsRequired:emergencydetails[i]['blood_units_required'].toString(),    
              priority: emergencydetails[i]['priority'].toString(),
              requestedDate: emergencydetails[i]['requested_date'].toString(),
            ),
          );
        }
        ;

        print('pet details' + _bloodrequest.toString());
        _isLoading = false;
        print('cateogory products loading completed --->' + 'loading data');
        notifyListeners();
        
      } else {
        _isLoading = true;
        notifyListeners();
      }
    } on HttpException catch (e) {
      // ignore: prefer_interpolation_to_compose_strings
      print('error in product prod -->>' + e.toString());
      print('Pet Data is one by one loaded the pet' + e.toString());
      _isLoading = false;

      _isSelect = false;
      notifyListeners();
    }
  }
Future<void> donationInterest({
  required String donorId,
  required String requestId,
  required BuildContext context,
}) async {
  final Uri url = Uri.parse(
    'http://campus.sicsglobal.co.in/Project/Blood_Bank/phpfiles/api/donation_interest.php?donor_id=$donorId&request_id=$requestId',
  );

  print("Request URL: $url"); // Debugging purpose

  try {
    final response = await https.post(url);
    print("Response: ${response.body}"); // Debugging response

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body); // Decode JSON

      if (jsonData['success'] == true) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.green,
            content: Text(
              'Request successful!',
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        );

        // Navigate after a short delay to allow user to see message
        Future.delayed(const Duration(seconds: 1), () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => Dashboardscreen()),
          );
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: appColor,
            content: Text(
              'You already have an ongoing donation. Please complete it before showing interest again.',
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: appColor,
          content: Text(
            'Failed to process request. Try again later.',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      );
      print('Failed. Status Code: ${response.statusCode}');
    }
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.red,
        content: Text(
          'Error occurred! Please check your internet connection.',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
    print('Exception: $e');
  }
}
}
