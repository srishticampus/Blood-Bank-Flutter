
import 'dart:convert';

import 'package:blood_bank_application/Colors/colors.dart';
import 'package:blood_bank_application/DashBoard/dashboardscreen.dart';
import 'package:blood_bank_application/Screens/Images/images.dart';
import 'package:blood_bank_application/Screens/LoginScreen/Loginapi/loginfarm.dart';
import 'package:blood_bank_application/Screens/LoginScreen/dialoguebox/dialogie.dart';
import 'package:blood_bank_application/Screens/LoginScreen/roundbutton.dart';
import 'package:blood_bank_application/Screens/Profile/API/usermodel.dart';
import 'package:blood_bank_application/Screens/Profile/API/userprovider.dart';

import 'package:blood_bank_application/Screens/RegisterScreen/registerscreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as https;
import 'package:provider/provider.dart';
import 'package:toastification/toastification.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
    void showToast(BuildContext context, String title, String description,
      ToastificationType type) {
    toastification.show(
      context: context,
      type: type,
      title: Text(title,style: TextStyle(fontWeight: FontWeight.bold),),
      description: Text(description),
      primaryColor: Colors.white,
      autoCloseDuration: const Duration(seconds: 3),
      progressBarTheme: ProgressIndicatorThemeData(
        color: type == ToastificationType.success
            ? appColor
            : type == ToastificationType.info
                ? Colors.blue
                : type == ToastificationType.warning
                    ? Colors.orange
                    : appColor,
      ),
      showProgressBar: true,
      backgroundColor: type == ToastificationType.success
          ? appColor
          : type == ToastificationType.info
              ? Colors.blue
              : type == ToastificationType.warning
                  ? Colors.orange
                  : appColor,
      foregroundColor: Colors.white,
    );
  }


  Future<void>loginBloodbank(String email, String password) async {
    const url = 'http://campus.sicsglobal.co.in/Project/Blood_Bank/phpfiles/api/login.php';

    Map<String, String> body = {'email': email, 'password': password};

  try {
      final response = await https.post(
        Uri.parse(url),
        body: body,
      );
      print(url);
      var jsonData = json.decode(response.body);
      print(jsonData);
      print(jsonData["success"]);
      if (response.statusCode == 200) {
        if (jsonData['success'] == true) {
           List user = jsonData['user'];
          if (user.isNotEmpty) {
            UserModel userdata = UserModel.fromJson(user[0]);
            String userId = userdata.id;
            Provider.of<UserProvider>(context, listen: false)
                .setCurrentUserId(userId);
            print(userId);
          }

          // ScaffoldMessenger.of(context).showSnackBar(
          //   SnackBar(
          //     backgroundColor: appColor,
          //     content: const Text(
          //       'Login Successful!',
          //       style:
          //           TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          //     ),
          //     duration: const Duration(seconds: 4),
          //   ),
          // );
           showToast(context, 'Login', 'Login Sucessful',
                  ToastificationType.success);

          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const Dashboardscreen()));
          print(body);
          print("Response body${response.body}");

          print('Login successful');
        } else if (jsonData['success'] == false) {
              showToast(context, 'Login Failed', 'Please try again later',
                  ToastificationType.error);
          // ScaffoldMessenger.of(context).showSnackBar(
          //   SnackBar(
          //     backgroundColor:appColor,
          //     content: const Text(
          //       'Login Failed! Please try again later',
          //       style:
          //           TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          //     ),
          //     duration: const Duration(seconds: 4),
          //   ),
          // );
          print('Error: ${response.statusCode}');
        }
      } else {
        print('fffff');
      }
    } catch (error) {
      print('Error: $error');
    }
  }
      void loginButton() {
      if (emailController.text.trim().isEmpty) {
        MyCustomAlertDialog().showCustomAlertdialog(
            context: context,
            title: 'Note',
            subtitle: "Please enter Email",
            onTapOkButt: () {
              Navigator.of(context).pop();
            });
      } else if (passwordController.text.trim().isEmpty) {
        MyCustomAlertDialog().showCustomAlertdialog(
            context: context,
            title: 'Note',
            subtitle: "Please enter Password",
            onTapOkButt: () {
              Navigator.of(context).pop();
            });
      } else {
       
            loginBloodbank(
              emailController.text,
              passwordController.text
               );
      }
    }


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: size.height * 0.2),
                  Image.asset(applogo, scale: 4),
                  SizedBox(height: size.height * 0.02),
                  const Text(
                    'Log in',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: size.height * 0.02),
                  const Text('Enter your email and password to login'),
                  SizedBox(height: size.height * 0.02),

                  // Email Field
                  loginTextField(
                  hintText: 'bloodbank@gmail.com',
                  icon:  CupertinoIcons.mail,
                   controller:  emailController,
                  validator:   (value) {
                      if (emailController.text.isEmpty) {
                        return 'Please enter your email';
                      }
                      return null;
                    },
                   color:  Colors.white.withOpacity(0.6),
                  ),
                  SizedBox(height: size.height * 0.05),

                  // Password Field
                  loginTextField(
                   hintText:'Password (8+ Characters)',
                   icon: CupertinoIcons.lock,
                  controller:passwordController,
                   validator: (value) {
                      if (passwordController.text.isEmpty) {
                        return 'Please enter your password';
                      } 
                      return null;
                    },
                  color:   Colors.white.withOpacity(0.6),
                  ),
                  SizedBox(height: size.height * 0.05),

                  // Login Button
                  LoginButton(
                    title: 'Login',
                    onTap: ()  {
                      loginButton();
                      // if (_formKey.currentState!.validate()) {
                       

                      //  loginBloodbank(emailController.text.toString(),passwordController.text.toString());
                      // }
                    },
                  ),
                  SizedBox(height: size.height * 0.02),

                  // Register Navigation
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don't have an account?"),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Registerscreen(),
                            ),
                          );
                        },
                        child: Text(
                          'Register',
                          style: TextStyle(color: appColor),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

}