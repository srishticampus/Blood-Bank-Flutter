import 'dart:convert';
import 'dart:io';
import 'package:blood_bank_application/API/DonationHistoryAPI/donationhistorymodel.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as https;

class Donationhistoryprovider with ChangeNotifier {
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

  List<DonationHistory> _donation = [];
  List<DonationHistory> get donation {
    return [..._donation];
  }

  Future getAllDonationHistory({required BuildContext context,String? donarId}) async {
    try {
      _isLoading = true;
      // var headers = {'Cookie': 'ci_session=c7lis868nec6nl8r1lb5el72q8n26upv'};
      var response = await https.get(
        Uri.parse(
            "http://campus.sicsglobal.co.in/Project/Blood_Bank/phpfiles/api/view_donation_history.php?donor_id=$donarId"),
      );

      print(
          "http://campus.sicsglobal.co.in/Project/Blood_Bank/phpfiles/api/view_donation_history.php?donor_id=$donarId");

      print(response.body);

      if (response.statusCode == 200) {
        _isLoading = false;
        _donation = [];
        var extractedData = json.decode(response.body);
        //  print(json.decode(response.body) + 'printed extrated data');
        final List<dynamic> donationhistory = extractedData['donation_history'];
        for (var i = 0; i < donationhistory.length; i++) {
          _donation.add(
            DonationHistory(
               id: donationhistory[i]['id'].toString(),
      requestId: donationhistory[i]['request_id'].toString(),
      status: donationhistory[i]['status'].toString(),
      bloodUnitReceived: donationhistory[i]['blood_unit_received'].toString(),
   
      updatedTime: donationhistory[i]['updated_time'].toString(),
            
            ),
          );
        }
        ;

        print('donation details' + _donation.toString());
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
}
