

import 'dart:convert';

import 'package:blood_bank_application/Screens/Images/images.dart';
import 'package:blood_bank_application/Screens/LoginScreen/loginscreen.dart';
import 'package:blood_bank_application/Screens/LoginScreen/roundbutton.dart';
import 'package:flutter/material.dart';
import 'package:blood_bank_application/Colors/colors.dart';
import 'package:http/http.dart'as https;


class Registerscreen2 extends StatefulWidget {

  final String name;
  final String dob;
  final String gender;
  final String bloodgroup;
  final String phone;
  final String email;
  final String city;
  final String pincode;
  final String password;
 
  const Registerscreen2({super.key, required this.name, required this.dob, required this.gender, required this.bloodgroup, required this.phone, required this.email, required this.city, required this.pincode, required this.password,});

  @override
  State<Registerscreen2> createState() => _Registerscreen2State();
}

class _Registerscreen2State extends State<Registerscreen2> {
  TextEditingController healathcontroller= TextEditingController();
  TextEditingController weightcontroller = TextEditingController();
  bool loading = false;
  int value = -1;
  var selecthealth='';
   final _formKey = GlobalKey<FormState>();
   Future<void>registerBloodbank(String helath,String weight) async {
    const url = 'http://campus.sicsglobal.co.in/Project/Blood_Bank/phpfiles/api/donor_reg.php';

    Map<String, String> body = {
       
      'full_name': widget.name, 
      'date_of_birth': widget.dob,
      'gender':widget.gender,
      'blood_group':widget.bloodgroup,
      'contact_number':widget.phone,
      'email':widget.email,
      'city':widget.city,
      'zip_code':widget.pincode,
      'password':widget.password,
      'health_status':helath,
      'weight':weight



      };

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

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: appColor,
              content: const Text(
                'Register Successful!',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              duration: const Duration(seconds: 4),
            ),
          );

          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const LoginScreen()));
          print(body);
          print("Response body${response.body}");

          print('Login successful');
        } else if (jsonData['success'] == false) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor:appColor,
              content: const Text(
                'User Exist! Please try again later',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              duration: const Duration(seconds: 4),
            ),
          );
          print('Error: ${response.statusCode}');
        }
      } else {
        print('fffff');
      }
    } catch (error) {
      print('Error: $error');
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
                       Center(
                          child: Image.asset(
                           applogo,scale: 3,
                           
                          ),),SizedBox(height: size.height * 0.03),
                      const Center(
                        child: Text(
                          'Helath Details',
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ),
                      SizedBox(height: size.height * 0.03),
                      
                      const Text(
                        'Health',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: size.height * 0.01),
                      DropdownButtonFormField<String>(
                                          
                        validator: (value) {
                           if(value!.isEmpty){
                             return 'Please select your health';
                           }
                         },
                       decoration: InputDecoration(border: OutlineInputBorder(
                         
                         borderRadius: BorderRadius.circular(10.0),borderSide: BorderSide(color: Colors.grey)
                       ),
                         enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.grey),
        ),
         focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.grey),
        ),
                       prefixIcon: Icon(Icons.health_and_safety,color: appColor),
                       fillColor: Colors.white.withOpacity(0.5),filled: true),
                                        value: selecthealth,
                                      
                                        items: [
                                         const DropdownMenuItem<String>(
                       child: Text('Select',style: TextStyle(color: Colors.grey,fontSize: 14),),
                       value: '',
                                      
                                          ),
                                          const DropdownMenuItem<String>(
                       child: Text('None',style: TextStyle(color: Colors.grey,fontSize: 14),),
                       value: 'None',
                                      
                                          ),
                                          const DropdownMenuItem<String>(
                       child: Text('Thalassemia',style: TextStyle(color: Colors.grey,fontSize: 14),),
                       value: 'Thalassemia',
                                          ),
                                          const DropdownMenuItem<String>(
                       child: Text('Diabetes',style: TextStyle(color: Colors.grey,fontSize: 14),),
                       value: 'Diabetes',
                                          ),
                                           const DropdownMenuItem<String>(
                       child: Text('Heart Disease',style: TextStyle(color: Colors.grey,fontSize: 14),),
                       value: 'Heart Disease',
                                          ),
                                           const DropdownMenuItem<String>(
                       child: Text('Severe lung disease',style: TextStyle(color: Colors.grey,fontSize: 14),),
                       value: 'Severe lung disease',
                                          ),
                                           const DropdownMenuItem<String>(
                       child: Text('Cancer',style: TextStyle(color: Colors.grey,fontSize: 14),),
                       value: 'Cancer',
                                          ),
                                         
                                           const DropdownMenuItem<String>(
                       child: Text('Hepatitis B and C',style: TextStyle(color: Colors.grey,fontSize: 14),),
                       value: 'Hepatitis B and C',
                                          ),
                                           const DropdownMenuItem<String>(
                       child: Text('Neurological illness',style: TextStyle(color: Colors.grey,fontSize: 14),),
                       value: 'Neurological illness',
                                          ),
                                           const DropdownMenuItem<String>(
                       child: Text('Undergoing steroid therapy',style: TextStyle(color: Colors.grey,fontSize: 14),),
                       value: 'Undergoing steroid therapy',
                                          ),
                                            const DropdownMenuItem<String>(
                       child: Text('Epilepsy',style: TextStyle(color: Colors.grey,fontSize: 14),),
                       value: 'Epilepsy',
                                          ),
                                            const DropdownMenuItem<String>(
                       child: Text('Other',style: TextStyle(color: Colors.grey,fontSize: 14),),
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
                                            const Text(
                        'Weight',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: size.height * 0.01),
                      register2TextField(
                      
                        'Weight', Icons.line_weight,  weightcontroller,
                      (value){
                        if(weightcontroller.text.isEmpty){
                          return 'Please enter your weight';
                        }
                        return null;
                      }
                          ),
                      SizedBox(height: size.height * 0.06),
                     
                      LoginButton(title: 'REGISTER', onTap: (){
                        registerBloodbank(
                          healathcontroller.text.toString(),
                          weightcontroller.text.toString()
                        );

                      })
                   
                    
                     
                     

                    
                      

                     

                      

                    
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

  Widget register2TextField(
      String hintText,
      IconData icon,
      TextEditingController controller,
       String? Function(String?)? validator,
    ) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        fillColor: Colors.white.withOpacity(0.6),
        filled: true,
        prefixIcon: Icon(
          icon,
          color: appColor,
        ),
        hintText: hintText,
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.grey),
        ),
      focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: appColor), borderRadius: BorderRadius.circular(10),),
        hintStyle: const TextStyle(fontSize: 13, color: Colors.grey),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        
          borderSide: const BorderSide(color: Colors.white)
        ),
      ),
        validator: validator,
    );
  }
}
