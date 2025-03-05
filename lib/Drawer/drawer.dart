import 'package:blood_bank_application/Colors/colors.dart';
import 'package:blood_bank_application/Screens/Images/drawericon.dart';
import 'package:blood_bank_application/Screens/Images/images.dart';
import 'package:blood_bank_application/Screens/Profile/API/userprovider.dart';
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
            menuList(totaldonaricon, 'Total Available Donars:23'),
            menuList(totaldonaricon, 'Total Successful Donations:50'),
            menuList(dprofileicon, 'Profile'),
            menuList(bloodreqicon, 'Blood Requirement'),
            menuList(bloodreqicon, 'Completed Requirement'),
            menuList(aboutusicon, 'About us'),
            menuList(contactusicon, 'Contact us'),
            menuList(notificationicon, 'Notifications'),
            menuList(blogouticon, 'Logout'),
          ],
        ),
      ),
    );
  }

  Widget menuList(String image, String title) {
    return ListTile(
      leading: Container(
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
      title: Text(
        title,
        style: const TextStyle(color: Colors.black, fontSize: 13),
      ),
    );
  }
}
