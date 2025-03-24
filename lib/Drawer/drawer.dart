import 'package:blood_bank_application/Colors/colors.dart';
import 'package:blood_bank_application/Screens/AboutScreen/aboutscreen.dart';
import 'package:blood_bank_application/Screens/Blood_donation_request/blood_donation_request.dart';
import 'package:blood_bank_application/Screens/Images/drawericon.dart';
import 'package:blood_bank_application/Screens/Images/images.dart';
import 'package:blood_bank_application/Screens/LoginScreen/loginscreen.dart';
import 'package:blood_bank_application/Screens/NotificationScreen/emptynotification.dart';
import 'package:blood_bank_application/Screens/Profile/API/userprovider.dart';
import 'package:blood_bank_application/Screens/Profile/profilescreen.dart';
import 'package:blood_bank_application/Screens/contactscreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DrawerMenu extends StatefulWidget {
  const DrawerMenu({super.key});

  @override
  State<DrawerMenu> createState() => _DrawerMenuState();
}

class _DrawerMenuState extends State<DrawerMenu> {
  @override
  void initState(){
    Provider.of<UserProvider>(context,listen: false).getUserData(context: context);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        height: double.infinity,
        decoration: BoxDecoration(color: backgroundColor
            //  gradient: LinearGradient(colors: [Colors.grey, appColor])
            ),
        child: Column(
          children: [
            UserAccountsDrawerHeader(
                otherAccountsPicturesSize: const Size(100, 100),
                decoration: BoxDecoration(color: appColor
                    // gradient: LinearGradient(colors: [Colors.grey, appColor])

                    ),
                accountName: Consumer<UserProvider>(builder: (context, value, child) {
                  String username = "";
                  for (var i = 0; i < value.users.length; i++) {
                    username = value.users[i].fullName;
                   
                  }
                  return  Text(username,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16),);
                }),
                currentAccountPicture: Consumer<UserProvider>(builder: (context, value, child) {
                  String username = "";
                  for (var i = 0; i < value.users.length; i++) {
                    username = value.users[i].avatar;
                   
                  }
                  return CircleAvatar(backgroundImage: NetworkImage(username),);
                }),
                accountEmail:Consumer<UserProvider>(builder: (context, value, child) {
                  String username = "";
                  for (var i = 0; i < value.users.length; i++) {
                    username = value.users[i].email;
                   
                  }
                  return  Text(username,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 12),);
                }),),
            menuList(dprofileicon, 'Profile',(){
              Navigator.push(context,MaterialPageRoute(builder: (context)=>Profilescreen()));
            }),
            menuList(bloodreqicon, 'Blood Requirement',(){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const BloodDonationRequestPage()));
            }),
            menuList(bloodreqicon, 'Completed Requirement',(){}),
            menuList(aboutusicon, 'About us',(){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const Aboutscreen()));
            }),
            menuList(contactusicon, 'Contact us',(){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>const Contactscreen()));
            }),
            menuList(notificationicon, 'Notifications',(){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const Emptynotification()));
            }),
            menuList(blogouticon, 'Logout',(){
                 showDialog(
              context: context,
              builder: (context) {
                return Dialog(
                  elevation: 1,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  child: Container(
                    width: 350,
                    height: MediaQuery.of(context).size.height / 4,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [appColor,Colors.grey]),
                        borderRadius: BorderRadius.circular(15.0),
                        boxShadow: [
                          BoxShadow(
                              offset: const Offset(12, 26),
                              blurRadius: 50,
                              spreadRadius: 0,
                              color: Colors.grey.withOpacity(.1)),
                        ]),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                      
                          radius: 25,
                         child: Image.asset('assets/logout.png',height: 25,width: 25,),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text("Logout",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold)),
                        const SizedBox(
                          height: 3.5,
                        ),
                        Text("Are you sure you want to logout?",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w300)),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    TextButton(onPressed: (){

                                      Navigator.push(context, MaterialPageRoute(builder: (context)=>const LoginScreen()));
                                    }, child: Text('Yes',style: TextStyle(color: Colors.white),)),
                                     TextButton(onPressed: (){
                                      Navigator.pop(context);
                                     }, child: Text('No',style: TextStyle(color: Colors.white)))
                                  ],
                                ),
                        const SizedBox(
                          height: 15,
                        ),
                      ],
                    ),
                  ),
                  
                );
              });
            }),
          ],
        ),
      ),
    );
  }

  Widget menuList(String image, String title,Function() onTap) {
    return ListTile(
      leading: InkWell(
        onTap: onTap,
        child: Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                    child: Image.asset(
                  image,
                  height: 30,
                  width: 30,
                  color: Colors.black,
                )),
              ],
            )),
      ),
      title: Text(
        title,
        style: const TextStyle(color: Colors.black, fontSize: 13),
      ),
    );
  }
}
