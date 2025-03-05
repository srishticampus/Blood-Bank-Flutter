import 'dart:io';

import 'package:blood_bank_application/Colors/colors.dart';
import 'package:blood_bank_application/DashBoard/dashboardscreen.dart';
import 'package:blood_bank_application/Screens/Profile/API/userprovider.dart';
import 'package:blood_bank_application/Screens/Profile/profilescreen.dart';
import 'package:blood_bank_application/Screens/Profile/widgets/profiletextform.dart';
import 'package:blood_bank_application/Screens/Images/images.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart'as http;

class Editprofilescreen extends StatefulWidget {
  const Editprofilescreen({super.key});

  @override
  State<Editprofilescreen> createState() => _EditprofilescreenState();
}

class _EditprofilescreenState extends State<Editprofilescreen> {
  TextEditingController fullnamecontroller =TextEditingController();
  TextEditingController datecontroller=TextEditingController();
  TextEditingController gendercontroller=TextEditingController();
  TextEditingController mobilenumberrcontroller=TextEditingController();
  TextEditingController emailcontroller=TextEditingController();
  TextEditingController citycontroller=TextEditingController();
  TextEditingController pincodecontroller=TextEditingController();
  final _formKey = GlobalKey<FormState>();
   File? _image;
  final ImagePicker _picker = ImagePicker();

  /// Function to Pick Image from Gallery or Camera
  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  /// Bottom Sheet for Choosing Image Source
  void _showImagePicker() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Wrap(
            children: [
              ListTile(
                  leading: const Icon(Icons.photo_library),
                  title: const Text("Pick from Gallery"),
                  onTap: () {
                    _pickImage(ImageSource.gallery);
                    Navigator.pop(context);
                  }),
              ListTile(
                  leading: const Icon(Icons.camera_alt),
                  title: const Text("Take a Photo"),
                  onTap: () {
                    _pickImage(ImageSource.camera);
                    Navigator.pop(context);
                  }),
            ],
          );
        });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        leading: IconButton(onPressed: (){
          Navigator.push(context,MaterialPageRoute(builder: (context)=>const Dashboardscreen()));
        }, icon: Icon(Icons.arrow_back,color: Colors.white)),
        backgroundColor: appColor,
        title: Text(
          'Edit Profile',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Stack(
                  children: [
                    CircleAvatar(
                      backgroundImage: _image != null ? FileImage(_image!) : const AssetImage(donarImage),
                      radius: 50.0,
                    ),
                    Positioned(
                        right: 5,
                        bottom: 0,
                        child: InkWell(
                          onTap: () {
                            _showImagePicker();
                          },
                          child: Container(
                              child: const Icon(
                                Icons.camera_alt_outlined,
                                color: Colors.black,
                                size: 20,
                              ),
                              padding: const EdgeInsets.all(7.5),
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(width: 1, color: Colors.white),
                                  borderRadius: BorderRadius.circular(90.0),
                                  color: Colors.grey[200])),
                        )),
                  ],
                ),
                Profiletextform(hint: 'Full Name', icon: Icons.person_outline,controller:fullnamecontroller,validator: (value){
                  if(fullnamecontroller.text.isEmpty){
                    return 'Edit the name';
                  }
                  else{
                    return null;
                  }
                },),
                Profiletextform(
                    hint: 'Date of Birth', icon: Icons.calendar_today_outlined,controller: datecontroller,validator:(value){
                      if(datecontroller.text.isEmpty){
                        return 'Edit the date';
                      }
                      else{
                        return null;
                      }
                    },),
                Profiletextform(hint: 'Gender', icon: Icons.male_outlined,controller: gendercontroller,validator: (value){
                  if(gendercontroller.text.isEmpty){
                    return 'Edit the gender';
                  }
                  else{
                    return null;
                  }
                },),
                Profiletextform(
                    hint: 'Mobile Number', icon: Icons.phone_android_outlined,controller: mobilenumberrcontroller,
                    validator: (value){
                      if(mobilenumberrcontroller.text.isEmpty){
                        return 'Edit the mobile number';
            
                      }
                      else{
                        return null;
                      }
                    },
                    ),
                Profiletextform(hint: 'Email', icon: Icons.email_outlined,controller: emailcontroller,validator: (value){
                  if(emailcontroller.text.isEmpty){
                    return 'Edit the email';
                  }
                  else{
                    return null;
                  }
                },),
                Profiletextform(hint: 'City', icon: Icons.location_city_outlined,controller: citycontroller,
                validator: (value){
                  if(citycontroller.text.isEmpty){
                    return 'Edit the city';
                  }
                  else{
                    return null;
                  }
                },
                ),
                Profiletextform(
                    hint: 'Pincode', icon: Icons.location_on_outlined,controller: pincodecontroller,
                     validator: (value){
                      if(pincodecontroller.text.isEmpty){
                        return 'Edit the pincode';
                      }
                      else{
                        return null;
                      }
                     }, 
                    ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: appColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6))),
                    onPressed: () {
                      if(_formKey.currentState!.validate()){
                       updateProfileApi();
                      }
                     
                    },
                    child: Text(
                      'Save',
                      style: TextStyle(color: Colors.white),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  
  }
  Future<dynamic> updateProfileApi() async {
    try {
      final user = Provider.of<UserProvider>(context, listen: false);
      var request = http.MultipartRequest(
        'POST',
        Uri.parse(
            'http://campus.sicsglobal.co.in/Project/Blood_Bank/phpfiles/api/edit_profile.php'),
      );
      print(
          'http://campus.sicsglobal.co.in/Project/Blood_Bank/phpfiles/api/edit_profile.php');
      request.fields.addAll({
        'user_id': user.currentUserId ?? "1",
        'name': fullnamecontroller.text.trim(),
        'dob': datecontroller.text,
        'gender': gendercontroller.text.trim(),
        'blood_group': 'O+',
        'weight': '70',
        'contact_no': mobilenumberrcontroller.text.trim(),
        'email': emailcontroller.text.trim(),
        'city':citycontroller.text.trim(),
        'zip_code':pincodecontroller.text.trim(),
        'health_status':'None'
       
      });
        if (_image != null) {
        request.files.add(await http.MultipartFile.fromPath('avatar', _image!.path));
      }
      http.StreamedResponse response = await request.send();

      print(await response.stream.bytesToString());
 print(""" 'user_id': ${user.currentUserId??'1'},
        'name': ${fullnamecontroller.text.trim()},
        'dob': ${datecontroller.text.trim},
        'gender': ${gendercontroller.text.trim()},
        'blood_group': 'O+',
        'weight':'70',
        'contact_no': ${mobilenumberrcontroller.text.trim()},
        'email':${emailcontroller.text.trim()},
        'city'z;${citycontroller.text.trim()},
        'zip_code':${pincodecontroller.text.trim()},
        'health_status':'None'
        """);
      if (response.statusCode == 200) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                  backgroundColor:appColor,
                                  content: const Text("Profile Updated successfully...!",style: TextStyle(color:Colors.white,fontWeight: FontWeight.bold),)));
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const Profilescreen()));

        print(await response.stream.bytesToString());
      } else {
        print(response.reasonPhrase);
      }
    } catch (e) {
      print(e);
    }
  }
}


