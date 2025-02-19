
import 'dart:convert';
import 'dart:io';
import 'package:blood_bank_application/Screens/Profile/API/usermodel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as https;


class UserProvider with ChangeNotifier {
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


  List<UserModel> _users = [];
  List<UserModel> get users {
    return [..._users];
  }

  String? currentUserId;
  void setCurrentUserId(String userId) {
    currentUserId = userId;
    notifyListeners();
  }

  Future getUserData({BuildContext? context}) async {
    try {
      _isLoading = true;
      // var headers = {'Cookie': 'ci_session=c7lis868nec6nl8r1lb5el72q8n26upv'};
      var response = await https.get(
        Uri.parse(
            "http://campus.sicsglobal.co.in/Project/Blood_Bank/phpfiles/api/view_profile.php?user_id=$currentUserId"),
      );

      print(
          "http://campus.sicsglobal.co.in/Project/Blood_Bank/phpfiles/api/view_profile.php?user_id=$currentUserId");

      print(response.body);

      if (response.statusCode == 200) {
        _isLoading = false;
        _users = [];
        var extractedData = json.decode(response.body);
        //  print(json.decode(response.body) + 'printed extrated data');
        final List<dynamic> userDetails = extractedData['user'];
        for (var i = 0; i < userDetails.length; i++) {
          _users.add(
            UserModel(
                id:userDetails[i]['id'].toString(),
                email: userDetails[i]['email'].toString(),
                role:userDetails[i]['role'].toString(),
                fullName: userDetails[i]['full_name'].toString(),
                dateOfBirth: userDetails[i]['date_of_birth'].toString(),
                gender:userDetails[i]['gender'].toString(),
                bloodGroup: userDetails[i]['blood_group'].toString(),
                weight: userDetails[i]['weight'].toString(),
                contactNumber: userDetails[i]['contact_number'].toString(),
                city: userDetails[i]['city'].toString(),
                zipCode: userDetails[i]['zip_code'].toString(),
                healthStatus: userDetails[i]['health_status'].toString(),
                avatar: userDetails[i]['avatar'].toString(),
               
               
                ),
          );
        }
        ;

        print('product details' + _users.toString());
        _isLoading = false;
        print('products loading completed --->' + 'loading data');
        notifyListeners();
      } else {
        _isLoading = true;
        notifyListeners();
      }
    } on HttpException catch (e) {
      // ignore: prefer_interpolation_to_compose_strings
      print('error in product prod -->>' + e.toString());
      print('Product Data is one by one loaded the product' + e.toString());
      _isLoading = false;

      _isSelect = false;
      notifyListeners();
    }
  }
}