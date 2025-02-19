import 'package:blood_bank_application/Colors/colors.dart';
import 'package:blood_bank_application/Screens/Profile/API/userprovider.dart';
import 'package:blood_bank_application/Screens/Profile/profilescreen.dart';
import 'package:blood_bank_application/Screens/Profile/widgets/profiletextform.dart';
import 'package:blood_bank_application/Screens/Images/images.dart';
import 'package:flutter/material.dart';
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
  @override
  void initState(){
    Provider.of<UserProvider>(context,listen: false).getUserData(context: context);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
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
          child: Column(
            children: [
              Stack(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage(donarImage),
                    radius: 50.0,
                  ),
                  Positioned(
                      right: 5,
                      bottom: 0,
                      child: InkWell(
                        onTap: () {},
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
              Profiletextform(hint: 'Full Name', icon: Icons.person_outline,controller:fullnamecontroller),
              Profiletextform(
                  hint: 'Date of Birth', icon: Icons.calendar_today_outlined,controller: datecontroller,),
              Profiletextform(hint: 'Gender', icon: Icons.male_outlined,controller: gendercontroller,),
              Profiletextform(
                  hint: 'Mobile Number', icon: Icons.phone_android_outlined,controller: mobilenumberrcontroller,),
              Profiletextform(hint: 'Email', icon: Icons.email_outlined,controller: emailcontroller,),
              Profiletextform(hint: 'City', icon: Icons.location_city_outlined,controller: citycontroller,),
              Profiletextform(
                  hint: 'Pincode', icon: Icons.location_on_outlined,controller: pincodecontroller),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: appColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6))),
                  onPressed: () {},
                  child: Text(
                    'Save',
                    style: TextStyle(color: Colors.white),
                  ))
            ],
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
        'email': emailcontroller.text.trim(),
        'full_name': fullnamecontroller.text.trim(),
        'date_of_birth': datecontroller.text.trim(),
        'gender': gendercontroller.text.trim(),
        'blood_group': 'O+',
        'weight': '70',
        'contact_number': mobilenumberrcontroller.text.trim(),
        'city': citycontroller.text.trim(),
        'zip_code':pincodecontroller.text.trim(),
        'health_status':'None'
       
      });
    //     if (image != null) {
    //   request.files.add(await http.MultipartFile.fromPath('photo', image!.path));
    // }
      http.StreamedResponse response = await request.send();

      print(await response.stream.bytesToString());
   //  print( 
        // 'email: ${emailcontroller.text.trim()}',
        // 'full_name: ${fullnamecontroller.text.trim()}',
        // 'date_of_birth': datecontroller.text.trim(),
        // 'gender': gendercontroller.text.trim(),
        // 'blood_group': 'O+',
        // 'weight': '70',
        // 'contact_number': mobilenumberrcontroller.text.trim(),
        // 'city': citycontroller.text.trim(),
        // 'zip_code':pincodecontroller.text.trim(),
        // 'health_status':'None')
      if (response.statusCode == 200) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                  backgroundColor:Color.fromARGB(255, 31, 82, 32),
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


