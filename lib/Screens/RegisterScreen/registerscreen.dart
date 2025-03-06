import 'dart:convert';
import 'dart:io';

import 'package:blood_bank_application/Screens/LoginScreen/dialoguebox/dialogie.dart';
import 'package:blood_bank_application/Screens/LoginScreen/loginscreen.dart';
import 'package:blood_bank_application/Screens/RegisterScreen/registerfarm.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as https;

import 'package:blood_bank_application/Colors/colors.dart';
import 'package:image_picker/image_picker.dart';
import 'package:toastification/toastification.dart';

class Registerscreen extends StatefulWidget {
  const Registerscreen({super.key});

  @override
  State<Registerscreen> createState() => _RegisterscreenState();
}

class _RegisterscreenState extends State<Registerscreen> {
  TextEditingController fullNamecontroller=TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController pincodeController = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController weightcontroller = TextEditingController();
  var selectedGender = '';
  var selectedBloodGroup = '';
  var selecthealth = '';
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
                    : Colors.grey,
      ),
      showProgressBar: true,
      backgroundColor: type == ToastificationType.success
          ? appColor
          : type == ToastificationType.info
              ? Colors.blue
              : type == ToastificationType.warning
                  ? Colors.orange
                  : Colors.grey,
      foregroundColor: Colors.white,
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: ColorScheme.light(
              primary: Colors.white,
              onPrimary: appColor,
              surface: appColor,
              onSurface: Colors.white,
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null && picked != DateTime.now()) {
      // Format the date and set it in the TextField
      String formattedDate = "${picked.day}-${picked.month}-${picked.year}";
      dateController.text = formattedDate;
    }
  }
  
  XFile? file;
  String? base64Image;
  final ImagePicker _picker = ImagePicker();
   Future<void> pickImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);

    if (pickedFile != null) {
      setState(() {
        file = pickedFile;
      });

      // Convert image to base64
      File imageFile = File(pickedFile.path);
      List<int> imageBytes = await imageFile.readAsBytes();
      base64Image = base64Encode(imageBytes);
    }
  }

  Future<void> registerBloodbank(
    File? imageFile,
    String name,
    String dob,
    String gender,
    String bloodgroup,
    String phone,
    String email,
    String city,
    String pincode,
    String password,
    String health,
    String weight) async {
  const url = 'http://campus.sicsglobal.co.in/Project/Blood_Bank/phpfiles/api/donor_reg.php';

  try {
    var request = https.MultipartRequest('POST', Uri.parse(url));

    // Attach the image file if selected
    if (imageFile != null) {
      request.files.add(await https.MultipartFile.fromPath('avatar', imageFile.path));
    }

    // Add other form fields
    request.fields.addAll({
      'name': name,
      'dob': dob,
      'gender': gender,
      'blood_group': bloodgroup,
      'contact_no': phone,
      'email': email,
      'city': city,
      'zip_code': pincode,
      'password': password,
      'health_status': health,
      'weight': weight,
    });

    var response = await request.send();
    var responseBody = await response.stream.bytesToString();
    var jsonData = json.decode(responseBody);

      if (response.statusCode == 200) {
        if (jsonData['status'] == true) {
          showToast(context, 'Register', 'Registration Successful',
                  ToastificationType.success);
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const LoginScreen()));
          // print(body);
          // print("Response body${response.body}");
          // print(body);
          // print("Response body${response.body}");
          print('Registration successful');
        } else if (jsonData['status'] == false) {
           showToast(context, 'Register', 'Not Registered this user',
                  ToastificationType.success);
          print('Error: ${response.statusCode}');
        } else {
          print('Not working this api');
        }
      }
    } catch (error) {
      print('Error: $error');
    }
  }

  void registerButton() {

    if (file == null) {
      MyCustomAlertDialog().showCustomAlertdialog(
          context: context,
          title: 'Note',
          subtitle: "Please select an image",
          onTapOkButt: () {
            Navigator.of(context).pop();
          });}

  else if (fullNamecontroller.text.trim().isEmpty) {
      MyCustomAlertDialog().showCustomAlertdialog(
          context: context,
          title: 'Note',
          subtitle: "Please enter Full Name",
          onTapOkButt: () {
            Navigator.of(context).pop();
          });
    } else if (dateController.text.trim().isEmpty) {
      MyCustomAlertDialog().showCustomAlertdialog(
          context: context,
          title: 'Note',
          subtitle: "Please enter Date of Birth",
          onTapOkButt: () {
            Navigator.of(context).pop();
          });
    } else if (selectedGender.trim().isEmpty) {
      MyCustomAlertDialog().showCustomAlertdialog(
          context: context,
          title: 'Note',
          subtitle: "Please enter Gender",
          onTapOkButt: () {
            Navigator.of(context).pop();
          });
    } else if (selectedBloodGroup.trim().isEmpty) {
      MyCustomAlertDialog().showCustomAlertdialog(
          context: context,
          title: 'Note',
          subtitle: "Please enter Blood Group",
          onTapOkButt: () {
            Navigator.of(context).pop();
          });
    } else if (phoneController.text.trim().isEmpty) {
      MyCustomAlertDialog().showCustomAlertdialog(
          context: context,
          title: 'Note',
          subtitle: "Please enter Phone Number",
          onTapOkButt: () {
            Navigator.of(context).pop();
          });
    } else if (emailController.text.trim().isEmpty) {
      MyCustomAlertDialog().showCustomAlertdialog(
          context: context,
          title: 'Note',
          subtitle: "Please enter Email",
          onTapOkButt: () {
            Navigator.of(context).pop();
          });
    } else if (cityController.text.trim().isEmpty) {
      MyCustomAlertDialog().showCustomAlertdialog(
          context: context,
          title: 'Note',
          subtitle: "Please enter City",
          onTapOkButt: () {
            Navigator.of(context).pop();
          });
    } else if (pincodeController.text.trim().isEmpty) {
      MyCustomAlertDialog().showCustomAlertdialog(
          context: context,
          title: 'Note',
          subtitle: "Please enter Pincode",
          onTapOkButt: () {
            Navigator.of(context).pop();
          });
    } else if (passwordcontroller.text.trim().isEmpty) {
      MyCustomAlertDialog().showCustomAlertdialog(
          context: context,
          title: 'Note',
          subtitle: "Please enter Password",
          onTapOkButt: () {
            Navigator.of(context).pop();
          });
    } else if (selecthealth.trim().isEmpty) {
      MyCustomAlertDialog().showCustomAlertdialog(
          context: context,
          title: 'Note',
          subtitle: "Please enter Health Status",
          onTapOkButt: () {
            Navigator.of(context).pop();
          });
    } else if (weightcontroller.text.trim().isEmpty) {
      MyCustomAlertDialog().showCustomAlertdialog(
          context: context,
          title: 'Note',
          subtitle: "Please enter Weight",
          onTapOkButt: () {
            Navigator.of(context).pop();
          });
    } else {
      registerBloodbank(
         File(file!.path),
          fullNamecontroller.text,
          dateController.text,
          selectedGender.toString(),
          selectedBloodGroup.toString(),
          phoneController.text,
          emailController.text,
          cityController.text,
          pincodeController.text,
          passwordcontroller.text,
          selecthealth.toString(),
          weightcontroller.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Stack(
        children: [
          Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(30),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Center(
                        child: Text(
                          'Register',
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ),
                      SizedBox(height: size.height * 0.03),
                      Center(
                        child: Stack(children: [
                          CircleAvatar(
                            radius: 60,
                            backgroundImage: file != null ? FileImage(File(file!.path)) : null,
                child: file == null ? const Icon(Icons.camera_alt, size: 50, color: Colors.black) : null,
                          ),
                          Positioned(
                              right: 5,
                              bottom: 0,
                              child: InkWell(
                                onTap: () {
                                  showModalBottomSheet(
                                      context: context,
                                      builder: (builder) => bottomSheet());
                                },
                                child: Container(
                                    child: const Icon(
                                      Icons.camera_alt_outlined,
                                      color: Colors.black,
                                      size: 20,
                                    ),
                                    padding: const EdgeInsets.all(7.5),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 1, color: Colors.white),
                                        borderRadius:
                                            BorderRadius.circular(90.0),
                                        color: Colors.grey[200])),
                              ))
                        ]),
                      ),
                     registerFieldName(title: 'Full Name'),
                      SizedBox(height: size.height * 0.01),
                      registerTextField(
                        hintText: 'FullName',
                        icon: Icons.person_outline,
                        controller: fullNamecontroller,
                        onTap: () {},
                      ),
                      SizedBox(height: size.height * 0.03),
                      registerFieldName(title: 'Date of Birth'),
                      SizedBox(height: size.height * 0.01),
                      registerTextField(
                        hintText: 'Date of Birth(should be between 18 to 65 )',
                        icon: Icons.calendar_month_outlined,
                        controller: dateController,
                        onTap: () {
                          _selectDate(context);
                        },
                      ),
                      SizedBox(height: size.height * 0.03),
                      registerFieldName(title: 'Gender'),
                      SizedBox(height: size.height * 0.01),
                      DropdownButtonFormField<String>(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please select your gender';
                          }
                        },
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(color: Colors.grey)),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(color: Colors.grey),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(color: Colors.grey),
                            ),
                            prefixIcon:
                                Icon(Icons.male_outlined, color: appColor),
                            fillColor: Colors.white.withOpacity(0.5),
                            filled: true),
                        value: selectedGender,
                        items: [
                          const DropdownMenuItem<String>(
                            child: Text(
                              'Select',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 14),
                            ),
                            value: '',
                          ),
                          const DropdownMenuItem<String>(
                            child: Text(
                              'Male',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 14),
                            ),
                            value: 'Male',
                          ),
                          const DropdownMenuItem<String>(
                            child: Text(
                              'Female',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 14),
                            ),
                            value: 'Female',
                          ),
                          const DropdownMenuItem<String>(
                            child: Text(
                              'Others',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 14),
                            ),
                            value: 'Others',
                          )
                        ],
                        onChanged: (String? value) {
                          setState(() {
                            selectedGender = value!;
                          });
                        },
                      ),
                      SizedBox(height: size.height * 0.03),
                     registerFieldName(title: 'Blood Group'),
                      SizedBox(height: size.height * 0.01),
                      DropdownButtonFormField<String>(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please select your bloodgroup';
                          }
                        },
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(color: Colors.grey)),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(color: Colors.grey),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(color: Colors.grey),
                            ),
                            prefixIcon:
                                Icon(Icons.bloodtype_outlined, color: appColor),
                            fillColor: Colors.white.withOpacity(0.5),
                            filled: true),
                        value: selectedBloodGroup,
                        items: [
                          const DropdownMenuItem<String>(
                            child: Text(
                              'Select',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 14),
                            ),
                            value: '',
                          ),
                          const DropdownMenuItem<String>(
                            child: Text(
                              'A+',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 14),
                            ),
                            value: 'A+',
                          ),
                          const DropdownMenuItem<String>(
                            child: Text(
                              'A-',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 14),
                            ),
                            value: 'A-',
                          ),
                          const DropdownMenuItem<String>(
                            child: Text(
                              'B+',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 14),
                            ),
                            value: 'B+',
                          ),
                          const DropdownMenuItem<String>(
                            child: Text(
                              'B-',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 14),
                            ),
                            value: 'B-',
                          ),
                          const DropdownMenuItem<String>(
                            child: Text(
                              'O+',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 14),
                            ),
                            value: 'O+',
                          ),
                          const DropdownMenuItem<String>(
                            child: Text(
                              'O-',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 14),
                            ),
                            value: 'O-',
                          ),
                          const DropdownMenuItem<String>(
                            child: Text(
                              'AB+',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 14),
                            ),
                            value: 'AB+',
                          ),
                          const DropdownMenuItem<String>(
                            child: Text(
                              'AB-',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 14),
                            ),
                            value: 'AB-',
                          ),
                        ],
                        onChanged: (String? value) {
                          setState(() {
                            selectedBloodGroup = value!;
                          });
                        },
                      ),
                      SizedBox(height: size.height * 0.03),
                     registerFieldName(title: 'Mobile Number'),
                      SizedBox(height: size.height * 0.01),
                      registerTextField(
                        hintText: 'Mobile Number',
                        icon: Icons.phone_android_outlined,
                        controller: phoneController,
                        onTap: () {},
                      ),
                      SizedBox(height: size.height * 0.03),
                      registerFieldName(title: 'Email'),
                      SizedBox(height: size.height * 0.01),
                      registerTextField(
                        hintText: 'Email',
                        icon: Icons.email_outlined,
                        controller: emailController,
                        onTap: () {},
                      ),
                      SizedBox(height: size.height * 0.03),
                   registerFieldName(title: 'City'),
                      SizedBox(height: size.height * 0.01),
                      registerTextField(
                        hintText: 'City',
                        icon: Icons.location_on_outlined,
                        controller: cityController,
                        onTap: () {},
                      ),
                      SizedBox(height: size.height * 0.03),
                     registerFieldName(title: 'Pincode'),
                      SizedBox(height: size.height * 0.01),
                      registerTextField(
                        hintText: 'Pincode',
                        icon: Icons.location_on_outlined,
                        controller: pincodeController,
                        onTap: () {},
                      ),
                      SizedBox(height: size.height * 0.03),
                     registerFieldName(title: 'Password'),
                      SizedBox(height: size.height * 0.01),
                      registerTextField(
                        hintText: 'Password',
                        icon: Icons.lock_outlined,
                        controller: passwordcontroller,
                        onTap: () {},
                      ),
                      SizedBox(height: size.height * 0.03),
                     registerFieldName(title: 'Health'),
                      SizedBox(height: size.height * 0.01),
                      DropdownButtonFormField<String>(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please select your health';
                          }
                        },
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(color: Colors.grey)),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(color: Colors.grey),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(color: Colors.grey),
                            ),
                            prefixIcon: Icon(Icons.health_and_safety_outlined,
                                color: appColor),
                            fillColor: Colors.white.withOpacity(0.5),
                            filled: true),
                        value: selecthealth,
                        items: [
                          const DropdownMenuItem<String>(
                            child: Text(
                              'Select',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 14),
                            ),
                            value: '',
                          ),
                          const DropdownMenuItem<String>(
                            child: Text(
                              'None',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 14),
                            ),
                            value: 'None',
                          ),
                          const DropdownMenuItem<String>(
                            child: Text(
                              'Thalassemia',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 14),
                            ),
                            value: 'Thalassemia',
                          ),
                          const DropdownMenuItem<String>(
                            child: Text(
                              'Diabetes',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 14),
                            ),
                            value: 'Diabetes',
                          ),
                          const DropdownMenuItem<String>(
                            child: Text(
                              'Heart Disease',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 14),
                            ),
                            value: 'Heart Disease',
                          ),
                          const DropdownMenuItem<String>(
                            child: Text(
                              'Severe lung disease',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 14),
                            ),
                            value: 'Severe lung disease',
                          ),
                          const DropdownMenuItem<String>(
                            child: Text(
                              'Cancer',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 14),
                            ),
                            value: 'Cancer',
                          ),
                          const DropdownMenuItem<String>(
                            child: Text(
                              'Hepatitis B and C',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 14),
                            ),
                            value: 'Hepatitis B and C',
                          ),
                          const DropdownMenuItem<String>(
                            child: Text(
                              'Neurological illness',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 14),
                            ),
                            value: 'Neurological illness',
                          ),
                          const DropdownMenuItem<String>(
                            child: Text(
                              'Undergoing steroid therapy',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 14),
                            ),
                            value: 'Undergoing steroid therapy',
                          ),
                          const DropdownMenuItem<String>(
                            child: Text(
                              'Epilepsy',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 14),
                            ),
                            value: 'Epilepsy',
                          ),
                          const DropdownMenuItem<String>(
                            child: Text(
                              'Other',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 14),
                            ),
                            value: 'Other',
                          ),
                        ],
                        onChanged: (String? value) {
                          setState(() {
                            selecthealth = value!;
                          });
                        },
                      ),
                      SizedBox(height: size.height * 0.03),
                      registerFieldName(title: 'Weight'),
                      SizedBox(height: size.height * 0.01),
                      registerTextField(
                        hintText: 'Weight',
                        icon: Icons.line_weight_outlined,
                        controller: weightcontroller,
                        onTap: () {},
                      ),
                      SizedBox(height: size.height * 0.03),
                      Center(
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: appColor),
                              onPressed: () {
                                registerButton();
                              },
                              child: Text(
                                'Register',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              )))
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }


  Widget bottomSheet() {
    return Container(
        height: 100,
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            Text(
              "Choose Profile photo",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    pickImage(ImageSource.camera);
                  },
                  icon: Icon(
                    Icons.camera,
                    color: Colors.white,
                  ),
                  label: Text(
                    "Camera",
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(backgroundColor: appColor),
                ),
                SizedBox(
                  width: 20,
                ),
                ElevatedButton.icon(
                  onPressed: () {
                  pickImage(ImageSource.gallery);
                  },
                  icon: Icon(
                    Icons.image,
                    color: Colors.white,
                  ),
                  label: Text(
                    "Gallery",
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(backgroundColor: appColor),
                ),
              ],
            )
          ],
        ));
  }
}
