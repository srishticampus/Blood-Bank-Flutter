import 'package:blood_bank_application/Colors/colors.dart';
import 'package:blood_bank_application/Drawer/drawer.dart';
import 'package:blood_bank_application/Screens/Profile/API/userprovider.dart';
import 'package:blood_bank_application/Screens/Profile/editprofilescreen.dart';
import 'package:blood_bank_application/Screens/Profile/widgets/profilecard.dart';
import 'package:blood_bank_application/Screens/Images/images.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Profilescreen extends StatefulWidget {
  static const  routeName = '/profilescreen';
  const Profilescreen({super.key});

  @override
  State<Profilescreen> createState() => _ProfilescreenState();
}

class _ProfilescreenState extends State<Profilescreen> {
   @override
  void initState() {
    Provider.of<UserProvider>(context,listen: false).getUserData(context: context);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( 
        iconTheme: IconThemeData(color: Colors.white
        ),
        title: Text(
            'Profile',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
          ),
        backgroundColor: appColor,
      
      ),
      drawer: DrawerMenu(),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
        
            Card(
              color: appColor,
              child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                   Text(
                            'Profile Details',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,color: Colors.white
                            ),
                          ),
                          Divider(thickness: 1,color: Colors.white,),
                          Consumer<UserProvider>(builder: (context, value, child) {
                String userdob = "";
                for (var i = 0; i < value.users.length; i++) {
                  userdob = value.users[i].avatar;
                  print(userdob+'saljdjk');
                
                }
                return CircleAvatar(backgroundImage: NetworkImage(userdob),radius: 50);
              }),
                           Consumer<UserProvider>(builder: (context, value, child) {
                String userName = "";
                for (var i = 0; i < value.users.length; i++) {
                  userName = value.users[i].fullName;
                      print(userName+'saljdjk');
                
                }
                return Profilecard(icon: Icons.person_outline, value: 'Full Name : ${userName}');
              }),
               Consumer<UserProvider>(builder: (context, value, child) {
                String userdob = "";
                for (var i = 0; i < value.users.length; i++) {
                  userdob = value.users[i].dateOfBirth;
                  print(userdob+'saljdjk');
                
                }
                return Profilecard(icon: Icons.calendar_month_outlined, value: 'Date of Birth : ${userdob}');
              }),
               Consumer<UserProvider>(builder: (context, value, child) {
                String userdob = "";
                for (var i = 0; i < value.users.length; i++) {
                  userdob = value.users[i].gender;
                  print(userdob+'saljdjk');
                
                }
                return Profilecard(icon: Icons.male_outlined,value: 'Gender : ${userdob}');
              }),
               Consumer<UserProvider>(builder: (context, value, child) {
                String userdob = "";
                for (var i = 0; i < value.users.length; i++) {
                  userdob = value.users[i].contactNumber;
                  print(userdob+'saljdjk');
                
                }
                return Profilecard(icon: Icons.phone_android_outlined, value: 'Mobile Number : ${userdob}');
              }),
               Consumer<UserProvider>(builder: (context, value, child) {
                String userdob = "";
                for (var i = 0; i < value.users.length; i++) {
                  userdob = value.users[i].email;
                  print(userdob+'saljdjk');
                
                }
                return Profilecard(icon: Icons.email_outlined, value: 'Email : ${userdob}');
              }),
               Consumer<UserProvider>(builder: (context, value, child) {
                String userdob = "";
                for (var i = 0; i < value.users.length; i++) {
                  userdob = value.users[i].city;
                  print(userdob+'saljdjk');
                
                }
                return Profilecard(icon: Icons.my_location_outlined, value: 'City : ${userdob}');
              }),
               Consumer<UserProvider>(builder: (context, value, child) {
                String userdob = "";
                for (var i = 0; i < value.users.length; i++) {
                  userdob = value.users[i].zipCode;
                  print(userdob+'saljdjk');
                
                }
                return Profilecard(icon: Icons.location_on_outlined, value: 'Pincode : ${userdob}');
              }),
              
              
             
                      ElevatedButton(onPressed: (){
                        Navigator.push(context,MaterialPageRoute(builder: (context)=>Editprofilescreen()));
                      },
                      style: ElevatedButton.styleFrom(backgroundColor:Colors.white,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
                       child: Text('Edit Profile',style: TextStyle(color: appColor),))
                ],
              ),
            )),
            
          ],
        ),
      ),
    );
  }
}