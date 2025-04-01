import 'dart:convert';
import 'dart:io';
import 'package:blood_bank_application/API/OrganizationAPI/organizationmodel.dart';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as https;

class Organizationprovider with ChangeNotifier {
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

  List<OrganizationModel> _organization = [];
  List<OrganizationModel> get organization {
    return [..._organization];
  }

  Future getAllOrganizationData({required BuildContext context,required String userid}) async {
    try {
      _isLoading = true;
      // var headers = {'Cookie': 'ci_session=c7lis868nec6nl8r1lb5el72q8n26upv'};
      var response = await https.get(
        Uri.parse(
            "http://campus.sicsglobal.co.in/Project/Blood_Bank/phpfiles/api/view_organization.php?user_id=$userid"),
      );

      print(
      "http://campus.sicsglobal.co.in/Project/Blood_Bank/phpfiles/api/view_organization.php?user_id=$userid");

      print(response.body);

      if (response.statusCode == 200) {
        _isLoading = false;
        _organization = [];
        var extractedData = json.decode(response.body);
        //  print(json.decode(response.body) + 'printed extrated data');
        final List<dynamic> organizationdetails = extractedData['organization'];
        for (var i = 0; i < organizationdetails.length; i++) {
          _organization.add(
            OrganizationModel(
              organizationId:organizationdetails[i]['organization_id'].toString(),
    name:organizationdetails[i]['name'].toString(),
    regNo:organizationdetails[i]['reg_no'].toString(),
    contactNo:organizationdetails[i]['contact_no'].toString(),
    email:organizationdetails[i]['email'].toString(),
    city:organizationdetails[i]['city'].toString(),
            ),
          );
        }
        ;

        print('pet details' + _organization.toString());
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